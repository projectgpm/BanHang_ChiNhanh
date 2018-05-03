using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.ThanhToan
{
    public partial class LapThanhToanNCC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbpThanhToan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "PhieuTT":
                    int IDNhapKho = int.Parse(ccbPhieuThanhToan.Value.ToString());
                    var PhieuTT = DBDataProvider.DB.kNhapKhos.Where(x => x.IDNhapKho == IDNhapKho).FirstOrDefault();
                    txtSoTienDaTT.Text = PhieuTT.ThanhToan.ToString();
                    speSoTienTT.Text = PhieuTT.CongNo.ToString();
                    speSoTienTT.Enabled = false;
                    ListPhieuThanhToan(Convert.ToInt32(ccbKhachHang.Value.ToString()));
                    memoNoiDungTT.Text += " " + PhieuTT.CongNo.ToString() + " ĐỒNG";
                    break;
                case "Customer":
                    //ccbPhieuThanhToan.SelectedIndex = 0;
                    speSoTienTT.Text = "0";
                    int IDKhachHang = int.Parse(ccbKhachHang.Value.ToString());
                    var KhachHang = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
                    txtCongNoHienTai.Text = KhachHang.CongNo.ToString();
                    ccbPhieuThanhToan.Text = "";
                    ListPhieuThanhToan(IDKhachHang);
                    break;
                case "Review": break;
                default:
                    LuuThanhToan();
                    Reset();
                    break;
            }
        }

        private void ListPhieuThanhToan(int IDKhachHang)
        {
            var KhachHang = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
            memoNoiDungTT.Text = "";
            memoNoiDungTT.Text = "THANH TOÁN: " + KhachHang.HoTen.ToUpper();

            var ListNhapHang = DBDataProvider.ListPhieuNhapHang(IDKhachHang);
            ccbPhieuThanhToan.DataSource = ListNhapHang;
            ccbPhieuThanhToan.DataBind();
        }

        protected void dateEditControl_Init(object sender, EventArgs e)
        {
            Formats.InitDateEditControl(sender, e);
        }
        protected void Reset()
        {
            ccbKhachHang.DataBind();
            ccbKhachHang.SelectedIndex = -1;
            DevExpress.Web.ASPxEdit.ClearEditorsInContainer(formThanhToan);
            rdlHinhThuc.SelectedIndex = 0;
            dateNgayTT.Date = DateTime.Now;
        }
        public void LuuThanhToan()
        {
             using (var scope = new TransactionScope())
            {
                try
                {
                    double? SoTienThu = double.Parse(speSoTienTT.Number.ToString());
                    if (SoTienThu == 0)
                        throw new Exception("Chưa nhập số tiền thanh toán");
                    double? SoNoHienTai = double.Parse(txtCongNoHienTai.Text);
                    if (SoTienThu > SoNoHienTai)
                        throw new Exception("Số tiền thu không được vượt qua số nợ hiện tại");

                    int IDKhachHang = Convert.ToInt32(ccbKhachHang.Value.ToString());
                    string SoHoaDon = txtHoaDon.Text;
                    string NoiDung = memoNoiDungTT.Text;
                    DateTime NgayThu = Formats.ConvertToDateTime(dateNgayTT.Text);
                    int HinhThucThu = rdlHinhThuc.SelectedIndex == 0 ? 1 : 2;
                    double CongNoCu = double.Parse(txtCongNoHienTai.Text);

                    kPhieuThanhToanNCC thanhtoan = new kPhieuThanhToanNCC();
                    thanhtoan.STTPhieuThu = DBDataProvider.STTPhieuThanhToan_NCC(IDKhachHang);
                    thanhtoan.SoHoaDon = SoHoaDon;
                    thanhtoan.KhachHangID = IDKhachHang;
                    thanhtoan.SoTienThu = SoTienThu;
                    thanhtoan.NoiDung = NoiDung;
                    thanhtoan.NgayThu = NgayThu;
                    thanhtoan.NgayLap = DateTime.Now;
                    thanhtoan.NhanVienThuID = Formats.IDUser();
                    thanhtoan.HinhThucTTID = HinhThucThu;
                    thanhtoan.CongNoCu = CongNoCu;

                    DBDataProvider.DB.kPhieuThanhToanNCCs.InsertOnSubmit(thanhtoan);
                    DBDataProvider.DB.SubmitChanges();
                    int IDPhieuThu = thanhtoan.IDPhieuThu;

                    if (rdlHinhThuc.SelectedIndex == 0)
                    {
                        //Cap nhat thanh toan phieu đặt hàng
                        List<kNhapKho> ListPhieuNhapKho = DBDataProvider.ListPhieuNhapHang_ASC(IDKhachHang);// phiếu đã được duyệt & chưa thanh toán
                        int i = 0;
                        if (SoTienThu > 0 && ListPhieuNhapKho.Count > 0)
                        {
                            while (SoTienThu > 0 && i < ListPhieuNhapKho.Count)
                            {
                                double? TienNoDonHang = ListPhieuNhapKho[i].CongNo;
                                if (SoTienThu >= TienNoDonHang) //Thanh toán hết đơn hàng
                                {
                                    ListPhieuNhapKho[i].ThanhToan = ListPhieuNhapKho[i].TongTien; //cập nhật lại thanh toán = tổng tiền
                                    ListPhieuNhapKho[i].CongNo = 0;// cập nhật còn lại  = 0;
                                    ListPhieuNhapKho[i].TTThanhToan = 1;// đã thanh toán
                                    khKhachHang KH = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
                                    if (KH != null)
                                    {
                                        #region ghi nhật ký nhập kho để xem báo cáo
                                        khNhatKyCongNo nhatky = new khNhatKyCongNo();
                                        nhatky.NgayNhap = DateTime.Now;
                                        nhatky.DienGiai = "Thanh toán Nhà cung cấp";
                                        nhatky.NoDau = KH.CongNo;
                                        nhatky.NhapHang = 0;
                                        nhatky.TraHang = 0;
                                        nhatky.ThanhToan = TienNoDonHang;
                                        nhatky.NoCuoi = KH.CongNo - TienNoDonHang;
                                        nhatky.NhanVienID = Formats.IDUser();
                                        nhatky.SoPhieu = ListPhieuNhapKho[i].MaPhieu;
                                        nhatky.IDKhachHang = IDKhachHang;
                                        DBDataProvider.DB.khNhatKyCongNos.InsertOnSubmit(nhatky);
                                        DBDataProvider.DB.SubmitChanges();
                                        #endregion
                                        KH.CongNo -= TienNoDonHang; // - công nợ
                                    }
                                    SoTienThu -= TienNoDonHang;

                                }
                                else // Thanh toán 1 phần đơn hàng
                                {
                                    ListPhieuNhapKho[i].ThanhToan += SoTienThu; // cộng phần còn lại vào thanh toán.
                                    ListPhieuNhapKho[i].CongNo = ListPhieuNhapKho[i].TongTien - ListPhieuNhapKho[i].ThanhToan; // cập nhật phần còn lại
                                    //ListPhieuGiaoHang[i].TTThanhToan = 1;// đã thanh toán
                                    khKhachHang KH = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
                                    if (KH != null)
                                    {
                                        #region ghi nhật ký nhập kho để xem báo cáo
                                        khNhatKyCongNo nhatky = new khNhatKyCongNo();
                                        nhatky.NgayNhap = DateTime.Now;
                                        nhatky.DienGiai = "Thanh toán Nhà cung cấp";
                                        nhatky.NoDau = KH.CongNo;
                                        nhatky.NhapHang = 0;
                                        nhatky.TraHang = 0;
                                        nhatky.ThanhToan = SoTienThu;
                                        nhatky.NoCuoi = KH.CongNo - SoTienThu;
                                        nhatky.NhanVienID = Formats.IDUser();
                                        nhatky.SoPhieu = ListPhieuNhapKho[i].MaPhieu;
                                        nhatky.IDKhachHang = IDKhachHang;
                                        DBDataProvider.DB.khNhatKyCongNos.InsertOnSubmit(nhatky);
                                        DBDataProvider.DB.SubmitChanges();
                                        #endregion
                                        KH.CongNo -= SoTienThu; // - công nợ
                                    }
                                    SoTienThu -= SoTienThu;
                                }
                                i++;
                            }
                        }
                        else
                        {
                            // trừ công nợ thẳng.
                            khKhachHang KH = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
                            if (KH != null)
                            {
                                #region ghi nhật ký nhập kho để xem báo cáo
                                khNhatKyCongNo nhatky = new khNhatKyCongNo();
                                nhatky.NgayNhap = DateTime.Now;
                                nhatky.DienGiai = "Thanh toán Nhà cung cấp";
                                nhatky.NoDau = KH.CongNo;
                                nhatky.NhapHang = 0;
                                nhatky.TraHang = 0;
                                nhatky.ThanhToan = SoTienThu;
                                nhatky.NoCuoi = KH.CongNo - SoTienThu;
                                nhatky.NhanVienID = Formats.IDUser();
                                nhatky.SoPhieu = "";
                                nhatky.IDKhachHang = IDKhachHang;
                                DBDataProvider.DB.khNhatKyCongNos.InsertOnSubmit(nhatky);
                                DBDataProvider.DB.SubmitChanges();
                                #endregion
                                KH.CongNo -= SoTienThu; // - công nợ
                            }
                        }
                    }
                    else
                    {
                        int IDNhapKho = int.Parse(ccbPhieuThanhToan.Value.ToString());
                        kNhapKho PhieuNK = DBDataProvider.DB.kNhapKhos.Single(x => x.IDNhapKho == IDNhapKho);
                        double? TienNoDonHang = PhieuNK.CongNo;
                        if (SoTienThu >= TienNoDonHang)
                        {
                            PhieuNK.ThanhToan = PhieuNK.TongTien;
                            PhieuNK.CongNo = 0;
                            PhieuNK.TTThanhToan = 1;// đã thanh toán
                            khKhachHang KH = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
                            if (KH != null)
                            {
                                #region ghi nhật ký nhập kho để xem báo cáo
                                khNhatKyCongNo nhatky = new khNhatKyCongNo();
                                nhatky.NgayNhap = DateTime.Now;
                                nhatky.DienGiai = "Thanh toán Nhà cung cấp";
                                nhatky.NoDau = KH.CongNo;
                                nhatky.NhapHang = 0;
                                nhatky.TraHang = 0;
                                nhatky.ThanhToan = SoTienThu;
                                nhatky.NoCuoi = KH.CongNo - SoTienThu;
                                nhatky.NhanVienID = Formats.IDUser();
                                nhatky.SoPhieu = PhieuNK.MaPhieu;
                                nhatky.IDKhachHang = IDKhachHang;
                                DBDataProvider.DB.khNhatKyCongNos.InsertOnSubmit(nhatky);
                                DBDataProvider.DB.SubmitChanges();
                                #endregion
                                KH.CongNo -= SoTienThu;// - công nợ
                            }
                        }
                    }
                    DBDataProvider.DB.SubmitChanges();
                    scope.Complete();
                    // Reset();
                    cbpThanhToan.JSProperties["cp_Reset"] = true;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void btnRenew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ThanhToan/LapThanhToanNCC.aspx");
        }

    }
}
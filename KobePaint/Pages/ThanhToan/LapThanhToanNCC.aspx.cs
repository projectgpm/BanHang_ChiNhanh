using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.ThanhToan
{
    public partial class LapThanhToanNCC : System.Web.UI.Page
    {
        protected void cbpThanhToan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (e.Parameter == "Customer")
            {
                int IDKhachHang = int.Parse(ccbKhachHang.Value.ToString());
                var KhachHang = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
                txtCongNoHienTai.Text = KhachHang.TienTTConLai.ToString();                
                var ListNhapHang = DBDataProvider.ListImportUnPaid(IDKhachHang);
                ccbPhieuNhapKho.DataSource = ListNhapHang;
                ccbPhieuNhapKho.DataBind();
            }
            else
            {
                LuuThanhToan();
                Reset();
            }
        }
        protected void cbpSoTienDaTT_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            int IDPhieuNhapKho = int.Parse(ccbPhieuNhapKho.Value.ToString());
            var PhieuNK = DBDataProvider.DB.kNhapKhos.Where(x => x.IDNhapKho == IDPhieuNhapKho).FirstOrDefault();
            txtSoTienDaTT.Text = PhieuNK.TienTTDonHang.ToString();
            hiddenfield["TienNo"] = PhieuNK.TongDonHang - PhieuNK.TienTTDonHang;
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
            try
            {
                double? SoTienThu = double.Parse(speSoTienTT.Number.ToString());
                if (SoTienThu == 0)
                    throw new Exception("Chưa nhập số tiền thanh toán");
                double? SoNoHienTai = double.Parse(txtCongNoHienTai.Text);
                if (SoTienThu > SoNoHienTai)
                    throw new Exception("Số tiền thu không được vượt qua số nợ hiện tại");

                int IDSupplier = int.Parse(ccbKhachHang.Value.ToString());
                int STTPhieuThu = DBDataProvider.SerialPaymentSupplier(IDSupplier);
                string SoHoaDon = txtHoaDon.Text;
                string NoiDung = memoNoiDungTT.Text;
                DateTime NgayThu = Formats.ConvertToDateTime(dateNgayTT.Text);
                int NhanVienThuID = Formats.IDUser(); 
                int HinhThucThu = rdlHinhThuc.SelectedIndex == 0 ? 1 : 2;
                float CongNoCu = float.Parse(txtCongNoHienTai.Text);
                var PhieuThu = new kPhieuThanhToanNCC();
                PhieuThu.STTPhieuThu = STTPhieuThu;
                PhieuThu.SoHoaDon = SoHoaDon;
                PhieuThu.SoTienThu = SoTienThu;
                PhieuThu.NoiDung = NoiDung;
                PhieuThu.NgayThu = NgayThu;
                PhieuThu.NhanVienThuID = NhanVienThuID;
                PhieuThu.HinhThucTTID = HinhThucThu;
                PhieuThu.CongNoCu = CongNoCu;
                PhieuThu.KhachHangID = IDSupplier;
                PhieuThu.NgayLap = DateTime.Now;
                DBDataProvider.DB.kPhieuThanhToanNCCs.InsertOnSubmit(PhieuThu);
                DBDataProvider.DB.SubmitChanges();
                int IDPhieuThu = PhieuThu.IDPhieuThu;

                //Update Tong tien no cua khach hang
                var KhachHang = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDSupplier).Single();
                KhachHang.DaThanhToan += SoTienThu;
                KhachHang.TienTTConLai = KhachHang.TongCongNo - KhachHang.DaThanhToan;

                if (rdlHinhThuc.SelectedIndex == 0)
                {
                    //Cap nhat thanh toan phieu giao hang
                    List<kNhapKho> ListNhapKho = DBDataProvider.ListImportUnPaid(IDSupplier);
                    int i = 0;
                    while (SoTienThu > 0 && i < ListNhapKho.Count)
                    {
                        double? TienNoDonHang = ListNhapKho[i].TongDonHang - ListNhapKho[i].TienTTDonHang;
                        if (SoTienThu >= TienNoDonHang) //Thanh toán hết đơn hàng
                        {
                            ListNhapKho[i].TienTTDonHang = ListNhapKho[i].TongDonHang;
                            ListNhapKho[i].TrangThaiTT = true;
                            SoTienThu -= TienNoDonHang;
                        }
                        else // Thanh toán 1 phần đơn hàng
                        {
                            ListNhapKho[i].TienTTDonHang += SoTienThu;
                            ListNhapKho[i].TrangThaiTT = false;
                            SoTienThu -= SoTienThu;
                        }
                        DBDataProvider.InsertPhieuThuChiTiet(IDPhieuThu, ListNhapKho[i].IDNhapKho);
                        i++;
                    }
                }
                else
                {
                    int IDDonHang = int.Parse(ccbPhieuNhapKho.Value.ToString());
                    kNhapKho PhieuGH = DBDataProvider.DB.kNhapKhos.Single(x => x.IDNhapKho == IDDonHang);
                    double? TienNoDonHang = PhieuGH.TongDonHang - PhieuGH.TienTTDonHang;
                    if (SoTienThu >= TienNoDonHang)
                    {
                        PhieuGH.TienTTDonHang = PhieuGH.TongDonHang;
                        PhieuGH.TrangThaiTT = true;
                    }
                    else
                    {
                        PhieuGH.TienTTDonHang += SoTienThu;
                        PhieuGH.TrangThaiTT = false;
                    }
                    DBDataProvider.InsertPhieuThuChiTiet(IDPhieuThu, IDDonHang);
                }
                DBDataProvider.DB.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btnRenew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ThanhToan/KhachHangThanhToan.aspx");
        }

    }
}
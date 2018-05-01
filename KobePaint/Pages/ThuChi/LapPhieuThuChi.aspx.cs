using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.ThuChi
{
    public partial class LapPhieuThuChi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRenew_Click(object sender, EventArgs e)
        {
            DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/Pages/ThuChi/LapPhieuThuChi.aspx");
        }
        protected void cbpThem_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "ccbLoaiPhieuSelectedIndex":
                    memoNoiDung.Text = "";
                    spSoTien.Number = 0;
                    break;
                case "spSoTienOnNumberChanged":
                    memoNoiDung.Text = "";
                    memoNoiDung.Text = ccbLoaiPhieu.Text.ToUpper() + " " + ccbLoaiThuChi.Text.ToUpper() + " SỐ TIỀN: " + spSoTien.Text + " ĐỒNG";
                    break;
                case "Save": Save(); Rest(); break;
                case "redirect": DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/Pages/ThuChi/DanhSachThuChi.aspx"); break;
                default: break;
            }
        }

        private void Save()
        {
            using (var scope = new TransactionScope())
            {
                try
                {
                    int LoaiPhieu = Convert.ToInt32(ccbLoaiPhieu.Value.ToString());
                    pPhieuThuChi item = new pPhieuThuChi();
                    item.NgayLap = Convert.ToDateTime(dateNgayLap.Date);
                    item.NhanVienID = Formats.IDUser();
                    item.NguoiNop = txtKhachHang.Text;
                    item.NoiDung = memoNoiDung.Text;
                    item.SoTien = Convert.ToDouble(spSoTien.Number);
                    item.LoaiThuChiID = Convert.ToInt32(ccbLoaiThuChi.Value.ToString());
                    item.LoaiPhieu = LoaiPhieu;
                    item.NgayLuu = DateTime.Now;
                    string MaPhieu = "";
                    string MAX = (DBDataProvider.DB.pPhieuThuChis.Where(x => x.LoaiPhieu == LoaiPhieu).Count() + 1).ToString();

                    var ChiNhanh = DBDataProvider.DB.chChiNhanhs.Where(x => x.IDChiNhanh == Formats.IDChiNhanh()).FirstOrDefault();
                    item.DuDau = ChiNhanh.QuyThuChi;
                   
                    if (LoaiPhieu == 0)
                    {
                        //phiếu thu
                        MaPhieu = "PT";
                        for (int i = 1; i < (9 - MAX.Length); i++)
                        {
                            MaPhieu += "0";
                        }
                        MaPhieu += MAX;
                        item.DuCuoi = ChiNhanh.QuyThuChi += Convert.ToDouble(spSoTien.Number);
                    }
                    else
                    {
                        //phiếu chi
                        MaPhieu = "PC";
                        for (int i = 1; i < (9 - MAX.Length); i++)
                        {
                            MaPhieu += "0";
                        }
                        MaPhieu += MAX;
                        item.DuCuoi = ChiNhanh.QuyThuChi -= Convert.ToDouble(spSoTien.Number);
                    }

                    item.MaPhieu = MaPhieu;
                    DBDataProvider.DB.pPhieuThuChis.InsertOnSubmit(item);
                    DBDataProvider.DB.SubmitChanges();
                    scope.Complete();
                    cbpThem.JSProperties["cp_Reset"] = true;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }    
        }
        private void Rest()
        {
            ccbLoaiPhieu.Text = "";
            ccbLoaiThuChi.Text = "";
            spSoTien.Number = 0;
            txtKhachHang.Text = "";
            memoNoiDung.Text = "";
        }
        protected void gridLoaiThuChi_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexColumn(e);
        }

        protected void ccbLoaiThuChi_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ccbLoaiThuChi.DataBind();
        }

        protected void dateNgayLap_Init(object sender, EventArgs e)
        {
            Formats.InitDateEditControl(sender, e);
        }
    }
}
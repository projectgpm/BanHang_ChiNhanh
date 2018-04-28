using DevExpress.Web;
using KobePaint.App_Code;
using KobePaint.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.ThanhToan
{
    public partial class DanhSachThanhToan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hdfViewReport["view"] = 0;
            }
            if (hdfViewReport["view"].ToString() != "0")
            {
                reportViewer.Report = CreatReport();
                hdfViewReport["view"] = 0;
            }
        }

        private DevExpress.XtraReports.UI.XtraReport CreatReport()
        {
            if (hdfViewReport["view"].ToString() != "3")
            {
                rpPhieuThanhToan rp = new rpPhieuThanhToan();
                rp.odsPayNode.DataSource = oPhieuTTExport;
                rp.Parameters["IDKhachHang"].Value = oPhieuTTExport.IDCustomer;
                rp.Parameters["IDKhachHang"].Visible = false;
                rp.CreateDocument();
                return rp;
            }
            else
            {
                rpPhieuThanhToanCK rp = new rpPhieuThanhToanCK();
                rp.odsPayNodeDiscount.DataSource = oPhieuTTCKExport;
                rp.CreateDocument();
                return rp;
            }
        }

        protected void btnInPhieu_Init(object sender, EventArgs e)
        {
            ASPxButton btn = sender as ASPxButton;
            GridViewDataRowTemplateContainer container = btn.NamingContainer as GridViewDataRowTemplateContainer;
            btn.ClientSideEvents.Click = String.Format("function(s, e) {{ onPrintClick({0}); }}", container.KeyValue);
        }
        protected void cbpViewReport_Callback(object sender, CallbackEventArgsBase e)
        {
            int IDPhieuThu = int.Parse(e.Parameter);
            var PhieuTT = DBDataProvider.DB.gPhieuThus.Where(x => x.IDPhieuThu == IDPhieuThu).SingleOrDefault();
            hdfViewReport["view"] = PhieuTT.HinhThucTTID;
            if (PhieuTT.HinhThucTTID != 3)
            {
                oPhieuTTExport = new oPayNode();
                oPhieuTTExport.DebtBefore = float.Parse(PhieuTT.CongNoCu.ToString());
                oPhieuTTExport.Payment = float.Parse(PhieuTT.SoTienThu.ToString());
                oPhieuTTExport.DebtAfter = oPhieuTTExport.DebtBefore - oPhieuTTExport.Payment;
                oPhieuTTExport.AdditionInfo = PhieuTT.NoiDung;
                oPhieuTTExport.SerialPay = "PHIẾU THANH TOÁN " + PhieuTT.STTPhieuThu;
                oPhieuTTExport.NumPay = "";
                oPhieuTTExport.PayDate = DBDataProvider.TinhThanhCty() + ", " + Formats.ConvertToFullStringDate(DateTime.Parse(PhieuTT.NgayThu.ToString()));
                oPhieuTTExport.IDCustomer = int.Parse(PhieuTT.KhachHangID.ToString());
            }
            else
            {
                oPhieuTTCKExport = new oPayNodeDiscount();
                oPhieuTTCKExport.CustomerID = int.Parse(PhieuTT.KhachHangID.ToString());
                oPhieuTTCKExport.TotalDiscount = float.Parse(PhieuTT.TongChietKhau.ToString());
                oPhieuTTCKExport.DiscountPaid = float.Parse(PhieuTT.ChietKhauDaTT.ToString());
                oPhieuTTCKExport.Discount = float.Parse(PhieuTT.ChietKhauConLai.ToString());
                oPhieuTTCKExport.Imprested = float.Parse(PhieuTT.TienDaTamUng.ToString());
                oPhieuTTCKExport.Payment = float.Parse(PhieuTT.TienThanhToan.ToString());
                oPhieuTTCKExport.iType = PhieuTT.NoiDung; 
                oPhieuTTCKExport.DebtBefore = float.Parse(PhieuTT.CongNoCu.ToString());
                oPhieuTTCKExport.DebtAfter = oPhieuTTCKExport.DebtBefore - (oPhieuTTCKExport.Payment + oPhieuTTCKExport.Discount);
                oPhieuTTCKExport.CustomerCode = PhieuTT.khKhachHang.MaKhachHang;
                oPhieuTTCKExport.CustomerName = PhieuTT.khKhachHang.HoTen;
                oPhieuTTCKExport.CustomerPhone = PhieuTT.khKhachHang.DienThoai;
                oPhieuTTCKExport.title = "PHIẾU THANH TOÁN " + PhieuTT.STTPhieuThu + "(KÈM CHIẾT KHẤU)";
                oPhieuTTCKExport.iDate = DBDataProvider.TinhThanhCty() + ", " + Formats.ConvertToFullStringDate(Formats.ConvertToDateTime(PhieuTT.NgayThu.ToString()));
            }
        }


        private oPayNode oPhieuTTExport
        {
            get
            {
                return (oPayNode)Session["oPhieuTT"];
            }
            set
            {
                Session["oPhieuTT"] = value;
            }
        }

        private oPayNodeDiscount oPhieuTTCKExport
        {
            get
            {
                return (oPayNodeDiscount)Session["oPhieuTTCK"];
            }
            set
            {
                Session["oPhieuTTCK"] = value;
            }
        }
        
    }
}
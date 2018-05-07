using DevExpress.Export;
using DevExpress.Web;
using DevExpress.XtraPrinting;
using KobePaint.App_Code;
using KobePaint.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.BaoCao
{
    public partial class DoanhThuDaiLy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hdfViewReport["view"] = 0;
            }
            if (hdfViewReport["view"].ToString() != "0")
            {
                if (hdfViewReport["view"].ToString() == "1")
                    reportViewer.Report = CreatReport();
                else
                    reportViewer.Report = CreatReportNoPrice();
                hdfViewReport["view"] = 0;
            }
        }
        rpPhieuGiaoHang CreatReport()
        {
            rpPhieuGiaoHang rp = new rpPhieuGiaoHang();
            rp.odsPhieuGiaoHang.DataSource = oCusExport;
            rp.CreateDocument();
            return rp;
        }
        rpPhieuGiaoHangNoPrice CreatReportNoPrice()
        {
            rpPhieuGiaoHangNoPrice rp = new rpPhieuGiaoHangNoPrice();
            rp.odsPhieuGiaoHang.DataSource = oCusExport;
            rp.CreateDocument();
            return rp;
        }
        protected void btnInPhieu_Init(object sender, EventArgs e)
        {
            ASPxButton btn = sender as ASPxButton;
            GridViewDataRowTemplateContainer container = btn.NamingContainer as GridViewDataRowTemplateContainer;
            btn.ClientSideEvents.Click = String.Format("function(s, e) {{ onPrintClick({0}); }}", container.KeyValue);
        }
        private oReportGiaoHang oCusExport
        {
            get
            {
                return (oReportGiaoHang)Session["ocus"];
            }
            set
            {
                Session["ocus"] = value;
            }
        }
        protected void cbpViewReport_Callback(object sender, CallbackEventArgsBase e)
        {
            int IDPhieuGiaoHang = int.Parse(e.Parameter);
            var PhieuGiaoHang = DBDataProvider.GetPhieuGiaoHang(IDPhieuGiaoHang);

            oCusExport = new oReportGiaoHang();
            oCusExport.MaKhachHang = PhieuGiaoHang.khKhachHang.MaKhachHang;
            oCusExport.TenKhachHang = PhieuGiaoHang.khKhachHang.HoTen;
            oCusExport.DienThoai = PhieuGiaoHang.DienThoai;
            oCusExport.DiaChiGiaoHang = PhieuGiaoHang.DiaChiGiaoHang;
            oCusExport.TenNhanVien = PhieuGiaoHang.nvNhanVien.HoTen;
            oCusExport.GhiChuGiaoHang = PhieuGiaoHang.GhiChuGiaoHang;
            oCusExport.NgayGiao = Formats.ConvertToVNDateString(PhieuGiaoHang.NgayGiao.ToString());
            oCusExport.NgayTao = Formats.ConvertToVNDateString(PhieuGiaoHang.NgayTao.ToString());
            oCusExport.TongSoLuong = Convert.ToInt32(PhieuGiaoHang.TongSoLuong);
            oCusExport.TongTien = Convert.ToDouble(PhieuGiaoHang.TongTien);
            oCusExport.ThanhToan = Convert.ToDouble(PhieuGiaoHang.ThanhToan);
            oCusExport.CongNoHienTai = Convert.ToDouble(PhieuGiaoHang.CongNoHienTai);
            oCusExport.SoHoaDon = PhieuGiaoHang.SoHoaDon;
            oCusExport.SoDonHangTrongNam = PhieuGiaoHang.SoDonHangTrongNam.ToString();
            oCusExport.TieuDePhieu = "PHIẾU GIAO HÀNG " + PhieuGiaoHang.STTDonHang;
            string TrangThai = "";
            switch (PhieuGiaoHang.TrangThai)
            {
                case 0:
                    TrangThai = "(Đã đặt)";
                    break;
                case 1:
                    TrangThai = "(Kiêm phiếu xuất kho)";
                    break;
                default:
                    TrangThai = "(Đã hủy)";
                    break;
            }
            oCusExport.TrangThaiPhieu = TrangThai;
            oCusExport.listProduct = new List<oProduct>();
            List<ghPhieuGiaoHangChiTiet> ListHang = DBDataProvider.ListChiTietGiaoHang(IDPhieuGiaoHang);
            int i = 1;
            foreach (var Hang in ListHang)
            {
                oProduct prod = new oProduct();
                prod.STT = i++;
                prod.MaHang = Hang.hhHangHoa.MaHang;
                prod.TenHang = Hang.hhHangHoa.TenHangHoa;
                prod.TenDonViTinh = Hang.hhHangHoa.hhDonViTinh.TenDonViTinh;
                prod.SoLuong = Convert.ToInt32(Hang.SoLuong);
                prod.DonGia = Convert.ToDouble(Hang.GiaBan);
                prod.ThanhTien = Convert.ToDouble(Hang.ThanhTien);
                oCusExport.listProduct.Add(prod);
            }
        }
        protected void dateEditControl_Init(object sender, EventArgs e)
        {
            Formats.InitDateEditControlNoValue(sender, e);
        }
        protected void grid_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexColumn(e);
        }

        protected void btnXuatExcel_Click(object sender, EventArgs e)
        {
            exporterGrid.WriteXlsxToResponse(new XlsxExportOptionsEx { ExportType = ExportType.WYSIWYG });
        }
    }
}
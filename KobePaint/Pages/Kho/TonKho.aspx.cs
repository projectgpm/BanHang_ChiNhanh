using DevExpress.Export;
using DevExpress.Web;
using DevExpress.XtraPrinting;
using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.Kho
{
    public partial class TonKho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Pages/TaiKhoan/DangNhap.aspx");
            }
            if (!IsPostBack)
            {
                LoadDanhSach();
            }
        }
        

        protected void btnXuatExcel_Click(object sender, EventArgs e)
        {
            exproter.WriteXlsxToResponse(new XlsxExportOptionsEx { ExportType = ExportType.WYSIWYG });
        }

        protected void gridTonKho_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexColumn(e);
        }

        protected void ccbLoaiTonKho_SelectedIndexChanged(object sender, EventArgs e)
        {
            //LoadDanhSach();
        }

        protected void LoadDanhSach()
        {
            if (Convert.ToInt32(ccbLoaiTonKho.Value.ToString()) == 0)
            {
                //hàng có tồn kho
                dsTonKho.SelectCommand = "SELECT [IDHangHoa], [MaHang], [TenHangHoa], ([GiaBan] * [TonKho]) as GiaTriTonKho, ([GiaVon] *  [TonKho]) as VonTonKho, [TonKho], [DonViTinhID], [NhomHHID] FROM [hhHangHoa] WHERE ([DaXoa] = 0 AND [TonKho] > 0 )";
                gridTonKho.DataBind();
            }
            else if (Convert.ToInt32(ccbLoaiTonKho.Value.ToString()) == 1)
            {
                // hàng hóa không tồn kho
                dsTonKho.SelectCommand = "SELECT [IDHangHoa], [MaHang], [TenHangHoa], ([GiaBan] * [TonKho]) as GiaTriTonKho, ([GiaVon] *  [TonKho]) as VonTonKho, [TonKho], [DonViTinhID], [NhomHHID] FROM [hhHangHoa] WHERE ([DaXoa] = 0 AND [TonKho] < 1)";
                gridTonKho.DataBind();
            }
            else
            {
                dsTonKho.SelectCommand = "SELECT [IDHangHoa], [MaHang], [TenHangHoa], ([GiaBan] * [TonKho]) as GiaTriTonKho, ([GiaVon] *  [TonKho]) as VonTonKho, [TonKho], [DonViTinhID], [NhomHHID] FROM [hhHangHoa] WHERE ([DaXoa] = 0)";
                gridTonKho.DataBind();
            }
        }

        protected void cbpTonKho_Callback(object sender, CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "DataSourceTK":
                    LoadDanhSach();
                    break;
                default:
                     dsTonKho.SelectCommand = "SELECT [IDHangHoa], [MaHang], [TenHangHoa], ([GiaBan] * [TonKho]) as GiaTriTonKho, ([GiaVon] *  [TonKho]) as VonTonKho, [TonKho], [DonViTinhID], [NhomHHID] FROM [hhHangHoa] WHERE ([DaXoa] = 0)";
                     gridTonKho.DataBind();
                    break;
            }
        }

        protected void gridTheKho_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["IDHangHoa"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void gridTonKho_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
           // int TonKho = Convert.ToInt32(e.NewValues["TonKho"]);
          //  if(TonKho < 1)
                
        }
    }
}
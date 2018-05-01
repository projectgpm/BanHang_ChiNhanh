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
                case "Save": Save(); break;
                case "redirect": DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/Pages/HangHoa/HangHoa.aspx"); break;
                default: break;
            }
        }

        private void Save()
        {
            using (var scope = new TransactionScope())
            {
                try
                {

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }    
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
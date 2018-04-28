using DevExpress.Web;
using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.GiaoHang
{
    public partial class DanhSachGiaoHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridChiTietDonHang_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["PhieuGiaoHangID"] = (sender as ASPxGridView).GetMasterRowKeyValue(); 
        }

        protected void gridChiTietDonHang_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexGroupColumn(sender, e);
        }

        protected void gridGiaoHang_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexGroupColumn(sender, e);
        }

        protected void gridGiaoHang_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }

       
    }
}
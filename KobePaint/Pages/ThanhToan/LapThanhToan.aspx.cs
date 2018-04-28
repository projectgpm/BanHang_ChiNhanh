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
    public partial class LapThanhToan : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hiddenfield["view"] = 0;
            }
            if (hiddenfield["view"].ToString() != "0")
            {
                //reportViewer.Report = CreatReport();
                hiddenfield["view"] = 0;
            }
        }

        protected void cbpThanhToan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if(e.Parameter == "Customer")
            {
                int IDKhachHang = int.Parse(ccbKhachHang.Value.ToString());
                var KhachHang = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
                txtCongNoHienTai.Text = KhachHang.CongNo.ToString();
                memoNoiDungTT.Text = KhachHang.HoTen.ToUpper() + " THANH TOÁN";
                var ListDonHang = DBDataProvider.ListPhieuGiaoHang(IDKhachHang);
                ccbPhieuThanhToan.DataSource = ListDonHang;
                ccbPhieuThanhToan.DataBind();
            }
            else
            {
                if (e.Parameter == "Review")
                {
                   
                }
                else
                {
                    LuuThanhToan();
                    Reset();
                }
            }
        }
        protected void cbpSoTienDaTT_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            int IDPhieuThanhToan = int.Parse(ccbPhieuThanhToan.Value.ToString());
            var PhieuTT = DBDataProvider.DB.ghPhieuGiaoHangs.Where(x => x.IDPhieuGiaoHang == IDPhieuThanhToan).FirstOrDefault();
            txtSoTienDaTT.Text = PhieuTT.ThanhToan.ToString();
            hiddenfield["TienNo"] = PhieuTT.ConLai;
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
          
        }

        

       

        protected void btnRenew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ThanhToan/LapThanhToan.aspx");
        }
    }
    
}
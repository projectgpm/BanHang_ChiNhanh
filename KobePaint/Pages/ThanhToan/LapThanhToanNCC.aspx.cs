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

        }

        protected void btnRenew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ThanhToan/LapThanhToanNCC.aspx");
        }

    }
}
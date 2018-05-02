using KobePaint.App_Code;
using KobePaint.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.ThanhToan
{
    public partial class LapThanhToan : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void cbpThanhToan_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "PhieuTT":
                    int IDPhieuThanhToan = int.Parse(ccbPhieuThanhToan.Value.ToString());
                    var PhieuTT = DBDataProvider.DB.ghPhieuGiaoHangs.Where(x => x.IDPhieuGiaoHang == IDPhieuThanhToan).FirstOrDefault();
                    txtSoTienDaTT.Text = PhieuTT.ThanhToan.ToString();
                    speSoTienTT.Text = PhieuTT.ConLai.ToString();
                    speSoTienTT.Enabled = false;
                    ListPhieuThanhToan(Convert.ToInt32(ccbKhachHang.Value.ToString()));
                    memoNoiDungTT.Text += PhieuTT.ConLai.ToString() + " ĐỒNG";
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
            memoNoiDungTT.Text = KhachHang.HoTen.ToUpper() + " THANH TOÁN: ";
            
            var ListDonHang = DBDataProvider.ListPhieuGiaoHang(IDKhachHang);
            ccbPhieuThanhToan.DataSource = ListDonHang;
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
                    int IDKhachHang = Convert.ToInt32(ccbKhachHang.Value.ToString());
                    string SoHoaDon = txtHoaDon.Text;
                    string NoiDung = memoNoiDungTT.Text;
                    DateTime NgayThu = Formats.ConvertToDateTime(dateNgayTT.Text);
                    int NhanVienThuID = Formats.IDUser();
                    int HinhThucThu = rdlHinhThuc.SelectedIndex == 0 ? 1 : 2;
                    float CongNoCu = float.Parse(txtCongNoHienTai.Text);

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void btnRenew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ThanhToan/LapThanhToan.aspx");
        }
    }
    
}
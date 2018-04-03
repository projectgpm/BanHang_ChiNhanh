using DevExpress.Web;
using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.HangHoa
{
    public partial class ThemHangHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void Save()
        {
            //hhHangHoa hanghoa = new hhHangHoa();
            //hanghoa.TenHangHoa = txtTenHH.Text;
            //hanghoa.MaSo = txtMaHH.Text;
            //hanghoa.KyHieu = txtKyHieu.Text;
            //hanghoa.LoaiHHID = Convert.ToInt32(ccbLoaiHH.Value);
            //hanghoa.NhomHHID = Convert.ToInt32(ccbNhomHH.Value);
            //hanghoa.QuiCach = txtDVT.Text;
            //hanghoa.TrongLuong = Convert.ToDouble(spTrongLuong.Number);
            //hanghoa.GiaBan = Convert.ToDouble(spGiaBan.Number);
            //DBDataProvider.DB.hhHangHoas.InsertOnSubmit(hanghoa);
            //DBDataProvider.DB.SubmitChanges();
            //int IDHangHoa = hanghoa.IDHangHoa;
            //for (int i = 0; i < gridApGia.VisibleRowCount; i++)
            //{
            //    ASPxSpinEdit spApGia = gridApGia.FindRowCellTemplateControl(i, (GridViewDataColumn)gridApGia.Columns["Giá bán"], "spApGia") as ASPxSpinEdit;
            //    if (spApGia.Value == null) continue;
            //    object IDDaiLy = gridApGia.GetRowValues(i, "IDLoaiKhachHang");
            //    hhApGia ApGiaDaiLy = new hhApGia();
            //    ApGiaDaiLy.GiaBan = Convert.ToDouble(spApGia.Number);
            //    ApGiaDaiLy.HangHoaID = IDHangHoa;
            //    ApGiaDaiLy.LoaiKhachHangID = Convert.ToInt32(IDDaiLy);
            //    DBDataProvider.DB.hhApGias.InsertOnSubmit(ApGiaDaiLy);
            //}
            //DBDataProvider.DB.SubmitChanges();
        }

        public void Reset()
        {
            ASPxEdit.ClearEditorsInContainer(cbpThemHH);
            //gridApGia.DataBind();
        }

        protected void cbpThemHH_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if(e.Parameter == "Save")
            {
                Save();
                Reset();
            }
            else
            {
                if(e.Parameter=="Renew")
                {
                    Reset();
                }
            }
        }
        

        
    }
}
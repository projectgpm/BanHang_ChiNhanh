﻿using DevExpress.Export;
using DevExpress.Web;
using DevExpress.XtraPrinting;
using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
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

        protected void cbpThemHH_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "Save": 
                    Save(); 
                    ResetAddProductPanel();
                    break;
                case "Renew": ResetAddProductPanel(); break;
            }
        }

        private void Save()
        {
            int KT = DBDataProvider.DB.hhHangHoas.Where(x => x.TenHangHoa == txtTenHH.Text).Count();
            if (KT == 0)
            {
                hhHangHoa hanghoa = new hhHangHoa();
                hanghoa.TenHangHoa = txtTenHH.Text;
                string MaHangHoa = null;
                if (txtMaHH.Text == "")
                {
                    string strMaHang = "SP";
                    string MAX = (DBDataProvider.DB.hhHangHoas.Count() + 1).ToString();
                    for (int i = 1; i < (6 - MAX.Length); i++)
                    {
                        strMaHang += "0";
                    }
                    MaHangHoa = strMaHang + MAX;
                }
                else
                {
                    MaHangHoa = txtMaHH.Text;
                }
                hanghoa.MaHang = MaHangHoa;
                hanghoa.NhomHHID = Convert.ToInt32(ccbNhomHH.Value);
                hanghoa.DonViTinhID = Convert.ToInt32(ccbDVT.Value);
                hanghoa.TrongLuong = 0;
                hanghoa.GiaBan = Convert.ToDouble(spGiaBan.Number);
                hanghoa.GiaVon = Convert.ToDouble(spGiaVon.Number);
                hanghoa.DaXoa = false;
                hanghoa.NgayNhap = DateTime.Now;
                hanghoa.LoaiHHID = 1;
                int SL = Convert.ToInt32(spSoLuong.Number);
                if (SL > 0)
                {
                    #region Trường hợp số lượng > 0 thì tiến hành ghi thẻ kho
                    kTheKho thekho = new kTheKho();
                    thekho.NgayNhap = DateTime.Now;
                    thekho.DienGiai = "Khai báo hàng hóa";
                    thekho.Nhap = SL;
                    thekho.Xuat = 0;
                    thekho.Ton = SL;
                    DBDataProvider.DB.kTheKhos.InsertOnSubmit(thekho);
                    #endregion
                }
                hanghoa.TonKho = SL;
                DBDataProvider.DB.hhHangHoas.InsertOnSubmit(hanghoa);
                DBDataProvider.DB.SubmitChanges();
                int IDHangHoa = hanghoa.IDHangHoa;
                List<string> ListBarCode = GetListBarCode();
                if (ListBarCode.Count > 0)
                {
                    foreach (string barCode in ListBarCode)
                    {
                        int KT_barcode = DBDataProvider.DB.hhBarcodes.Where(x => x.Barcode == barCode).Count();
                        if (KT_barcode == 0)
                        {
                            hhBarcode bc = new hhBarcode();
                            bc.IDHangHoa = IDHangHoa;
                            bc.Barcode = barCode;
                            bc.DaXoa = false;
                            DBDataProvider.DB.hhBarcodes.InsertOnSubmit(bc);
                        }
                        else
                        {
                            throw new Exception("Barcode tồn tại đã bỏ qua!!");
                        }
                    }
                }
                else
                {
                    hhBarcode bc = new hhBarcode();
                    bc.IDHangHoa = IDHangHoa;
                    bc.Barcode = MaHangHoa;
                    bc.DaXoa = false;
                    DBDataProvider.DB.hhBarcodes.InsertOnSubmit(bc);
                }
                DBDataProvider.DB.SubmitChanges();
                lblthongbao.Text = "Thêm thành công.";
            }
            else
            {
                throw new Exception("Tên hàng hóa đã tồn tại!!");
            }
        }

        protected List<string> GetListBarCode()
        {
            ASPxTokenBox tkbListBarCode = tkBarcode;
            List<string> ListBarCode = new List<string>();
            foreach (string barCode in tkbListBarCode.Tokens)
            {
                ListBarCode.Add(barCode);
            }
            return ListBarCode;
        }
        protected void ResetAddProductPanel()
        {
            ccbDVT.Text = "";
            ccbDVT.DataBind();
            ccbNhomHH.Text = "";
            ccbNhomHH.DataBind();
            txtTenHH.Text = "";
            spSoLuong.Number = 0;
            spGiaBan.Number = 0;
            spGiaVon.Number = 0;
            tkBarcode.Text = "";
            tkBarcode.NullText = "Hệ thống tự tạo barcode giống với mã hàng hóa nếu bỏ trống.";
            txtMaHH.Text = "";
            txtMaHH.NullText = "Hệ thống tự tạo nếu để trống.";
        }


        protected void gridDVT_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexColumn(e);
        }

        protected void ccbDVT_Callback(object sender, CallbackEventArgsBase e)
        {
            ccbDVT.DataBind();
        }

        protected void btnXuatExcel_NhomHang_Click(object sender, EventArgs e)
        {
            exproter_NhomHang.WriteXlsxToResponse(new XlsxExportOptionsEx { ExportType = ExportType.WYSIWYG });
        }

        protected void ccbNhomHH_Callback(object sender, CallbackEventArgsBase e)
        {
            ccbNhomHH.DataBind();
        }

        protected void btnXuatExcel_DVT_Click(object sender, EventArgs e)
        {
            exproter_DVT.WriteXlsxToResponse(new XlsxExportOptionsEx { ExportType = ExportType.WYSIWYG });
        }

        protected void gridNhomHang_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexColumn(e);
        }
        
    }
}
using DevExpress.Web;
using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.Kho
{
    public partial class NhapKho : System.Web.UI.Page
    {
        public List<oImportProduct> listReceiptProducts
        {
            get
            {
                if (Session["sslistReceiptProducts"] == null)
                    Session["sslistReceiptProducts"] = new List<oImportProduct>();
                return (List<oImportProduct>)Session["sslistReceiptProducts"];
            }
            set
            {
                Session["sslistReceiptProducts"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] infoUser = Context.User.Identity.Name.Split('-');
                txtNguoiNhap.Text = infoUser[1];
                listReceiptProducts = new List<oImportProduct>();                
            }
        }

        protected void dateEditControl_Init(object sender, EventArgs e)
        {
            Formats.InitDateEditControl(sender, e);
        }

        protected void cbpInfoImport_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {            
            if(e.Parameter == "price")
            {
                GetPrice();
            }
            else
                InsertIntoGrid();
        }
        protected void GetPrice()
        {
            //int IDProduct = int.Parse(ccbProduct.Value.ToString());
            //int IDSupplier = int.Parse(ccbSupplier.Value.ToString());
            //var dataPriceOld = DBDataProvider.DB.kNhapKhoChiTiets.Where(x => x.HangHoaID == IDProduct && x.kNhapKho.NCCID == IDSupplier).OrderByDescending(o => o.ID).FirstOrDefault();
            //if (dataPriceOld != null)
            //{
            //    speReceiptPrice.Number = decimal.Parse(dataPriceOld.DonGia.ToString());
            //}
            //else
            //{
            //    speReceiptPrice.Number = 0;
            //}
            //var dataPriceSell = DBDataProvider.DB.hhHangHoas.Where(x => x.IDHangHoa == IDProduct).FirstOrDefault();
            //if (dataPriceSell != null)
            //{
            //    decimal issuePrice = decimal.Parse(dataPriceSell.GiaBan.ToString());
            //    speIssuePrice.Number = issuePrice;
            //    hiddenFields["IssuePriceOld"] = issuePrice;
            //    hiddenFields["ProductNum"] = dataPriceSell.MaSo;
            //    hiddenFields["Measure"] = dataPriceSell.QuiCach;
            //}
        }
        protected void InsertIntoGrid()
        {
            int IDProduct = int.Parse(ccbProduct.Value.ToString());
            int IDColor = int.Parse(ccbColor.Value.ToString());

            var exitProdInList = listReceiptProducts.SingleOrDefault(r => r.ProductID == IDProduct && r.ColorID == IDColor);
            if (exitProdInList != null)
            {
                exitProdInList.Unit += int.Parse(speUnits.Number.ToString());
                exitProdInList.ReceiptPrice = float.Parse(speReceiptPrice.Number.ToString());
                exitProdInList.IssuePrice = float.Parse(speIssuePrice.Number.ToString());
                exitProdInList.Total = exitProdInList.Unit * exitProdInList.ReceiptPrice;
            }
            else
            {
                oImportProduct newRecpPro = new oImportProduct(IDProduct, ccbProduct.Text, hiddenFields["ProductNum"].ToString(),
                    IDColor, ccbColor.Text,
                    hiddenFields["Measure"].ToString(),
                    speUnits.Number.ToString(), speReceiptPrice.Number.ToString(),
                    speIssuePrice.Number.ToString(), hiddenFields["IssuePriceOld"].ToString());

                listReceiptProducts.Add(newRecpPro);
                UpdateSTT();
            }

            gridImportPro.DataSource = listReceiptProducts;
            gridImportPro.DataBind();

            speIssuePrice.Number = 0;
            speReceiptPrice.Number = 0;
            hiddenFields["IssuePriceOld"] = 0;
            hiddenFields["ProductNum"] = "";
            hiddenFields["Measure"] = "";
            speUnits.Number = 1;
            ccbColor.SelectedIndex = -1;
            ccbProduct.SelectedIndex = -1;
        }

        protected void Reset()
        {
            listReceiptProducts = new List<oImportProduct>();
            gridImportPro.DataSource = listReceiptProducts;
            gridImportPro.DataBind();
            
            ccbNhaCungCap.SelectedIndex = -1;
            txtReceiptNum.Text = "";
            memoAdditionInfo.Text = "";
            dateOrder.Date = DateTime.Now;

        }

        protected void UpdateSTT()
        {
            for(int i = 1; i <= listReceiptProducts.Count; i++)
            {
                listReceiptProducts[i - 1].STT = i;
            }            
        }        

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            //using (var scope = new TransactionScope())
            //{
            //    try
            //    {
            //        float TongDonHang = 0;
            //        foreach (var prod in listReceiptProducts)
            //        {
            //            TongDonHang += prod.Total;
            //        }
            //        int TongSoLuong = listReceiptProducts.Count;

            //        int IDSupplier = int.Parse(ccbSupplier.Value.ToString()); 
            //        //Insert vào bảng nhập kho
            //        kNhapKho nhapKho = new kNhapKho();
            //        nhapKho.NCCID = IDSupplier;
            //        nhapKho.MaPhieu = DBDataProvider.SerialImport(IDSupplier).ToString();
            //        nhapKho.MaHoaDon = txtReceiptNum.Text; ;
            //        nhapKho.NgayDonHang = Formats.ConvertToDateTime(dateOrder.Text);
            //        nhapKho.NgayNhap = DateTime.Now;
            //        nhapKho.NguoiNhapID = Formats.IDUser();
            //        nhapKho.TongDonHang = TongDonHang;
            //        nhapKho.TongSoLuong = TongSoLuong;
            //        nhapKho.GhiChu = memoAdditionInfo.Text;
                    
            //        DBDataProvider.DB.kNhapKhos.InsertOnSubmit(nhapKho);
            //        DBDataProvider.DB.SubmitChanges();
            //        int IDNhap = nhapKho.IDNhapKho;
                    
            //        foreach (var prod in listReceiptProducts)
            //        {
            //            //Insert vào chi tiết nhập kho
            //            kNhapKhoChiTiet detailNhapKho = new kNhapKhoChiTiet();
            //            detailNhapKho.NhapKhoID = IDNhap;
            //            detailNhapKho.HangHoaID = prod.ProductID;
            //            detailNhapKho.MaSoMauID = prod.ColorID;
            //            detailNhapKho.DonGia = prod.ReceiptPrice;
            //            detailNhapKho.GiaBan = prod.IssuePrice;
            //            detailNhapKho.SoLuong = prod.Unit;
            //            detailNhapKho.TongTien = prod.Total;
            //            DBDataProvider.DB.kNhapKhoChiTiets.InsertOnSubmit(detailNhapKho);
            //            //Cập nhật || Thêm tồn kho
            //            var TonKhoBanDau = DBDataProvider.DB.kTonKhos.Where(x => x.HangHoaID == prod.ProductID && x.MaSoMauID == prod.ColorID).FirstOrDefault();
            //            if(TonKhoBanDau != null)
            //            {
            //                TonKhoBanDau.SoLuong += prod.Unit;                            
            //                TonKhoBanDau.NgayCapNhat = DateTime.Now;
            //            }
            //            else
            //            {
            //                kTonKho TonKhoMoi = new kTonKho();
            //                TonKhoMoi.HangHoaID = prod.ProductID;
            //                TonKhoMoi.MaSoMauID = prod.ColorID;
            //                TonKhoMoi.SoLuong = prod.Unit;                            
            //                TonKhoMoi.NgayCapNhat = DateTime.Now;
            //                DBDataProvider.DB.kTonKhos.InsertOnSubmit(TonKhoMoi);
            //            }
            //            if(prod.IssuePrice != prod.IssueOldPrice)
            //            {
            //                hhHangHoa hang = DBDataProvider.DB.hhHangHoas.Where(x => x.IDHangHoa == prod.ProductID).FirstOrDefault();
            //                hang.GiaBan = prod.IssuePrice;
            //            }
            //        }
            //        //update công nợ 
            //        khKhachHang Supplier = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDSupplier).FirstOrDefault();
            //        if (Supplier != null)
            //        {
            //            nhapKho.CongNoCu = Supplier.TienTTConLai;
            //            nhapKho.TrangThaiTT = false;
            //            nhapKho.TienTTDonHang = 0;
            //            Supplier.TongCongNo += TongDonHang;
            //            Supplier.TienTTConLai += TongDonHang;
            //        }
            //        DBDataProvider.DB.SubmitChanges();
                    
            //        scope.Complete();
            //        Reset();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //}
        }
        
        protected void gridImportPro_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int stt = int.Parse(e.Keys["STT"].ToString());
            var itemToRemove = listReceiptProducts.SingleOrDefault(r => r.STT == stt);
            if (itemToRemove != null)
            {
                listReceiptProducts.Remove(itemToRemove);
                UpdateSTT();
            }
            e.Cancel = true;
            gridImportPro.DataSource = listReceiptProducts;
            gridImportPro.DataBind();
        }

        protected void ccbNhaCungCap_Callback(object sender, CallbackEventArgsBase e)
        {
            ccbNhaCungCap.DataBind();
        }
    }    
}
﻿using DevExpress.Web;
using KobePaint.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.Kho
{
    public partial class ThemXuatKhac : System.Web.UI.Page
    {
        public List<oImportProduct_ChiTietXuatKhac> listReceiptProducts
        {
            get
            {
                if (Session["sslistReceiptProducts"] == null)
                    Session["sslistReceiptProducts"] = new List<oImportProduct_ChiTietXuatKhac>();
                return (List<oImportProduct_ChiTietXuatKhac>)Session["sslistReceiptProducts"];
            }
            set
            {
                Session["sslistReceiptProducts"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    ccbBarcode.Focus();
                    string[] infoUser = Context.User.Identity.Name.Split('-');
                    txtNguoiNhap.Text = infoUser[1];
                    listReceiptProducts = new List<oImportProduct_ChiTietXuatKhac>();
                }
            }
            else
                Response.Redirect("~/Pages/TaiKhoan/DangNhap.aspx");
        }
        protected void cbpInfo_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string[] para = e.Parameter.Split('|');
            switch (para[0])
            {
                case "UnitChange": Unitchange(para[1]); BindGrid(); break;
                case "Save": Save(); Reset(); break;
                case "importexcel": BindGrid(); break;
                case "redirect": DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/Pages/Kho/DanhSachXuatKhac.aspx"); break;
                default: InsertIntoGrid(); BindGrid(); break;
            }
        }


        protected void Reset()
        {
            listReceiptProducts = new List<oImportProduct_ChiTietXuatKhac>();
            gridImportPro.DataSource = listReceiptProducts;
            gridImportPro.DataBind();
            memoGhiChu.Text = "";
            dateNgayNhap.Date = DateTime.Now;
            ccbBarcode.Text = "";
            ccbBarcode.Value = "";
            ccbBarcode.Focus();
        }
        #region InsertHang
        protected void InsertIntoGrid()
        {
            if (ccbBarcode.Text.Trim() != "")
            {
                if (ccbBarcode.Value == null)
                {
                    //barcode
                    int tbThongTin_Count = DBDataProvider.DB.hhBarcodes.Where(r => r.Barcode == ccbBarcode.Text.Trim()).Count();
                    if (tbThongTin_Count > 0)
                    {
                        var tbThongTin = DBDataProvider.DB.hhBarcodes.Where(r => r.Barcode == ccbBarcode.Text.Trim()).FirstOrDefault();
                        Insert_Hang(Convert.ToInt32(tbThongTin.IDHangHoa));
                    }
                    else
                    {
                        ccbBarcode.Value = "";
                        ccbBarcode.Text = "";
                        ccbBarcode.Focus();
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã hàng không tồn tại!!');", true);
                    }
                }
                else
                {
                    // idhanghoa
                    int IDProduct;
                    bool isNumeric = Int32.TryParse(ccbBarcode.Value.ToString(), out IDProduct);
                    if (isNumeric)
                    {
                        Insert_Hang(IDProduct);
                    }
                    else
                    {
                        ccbBarcode.Value = "";
                        ccbBarcode.Text = "";
                        ccbBarcode.Focus();
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã hàng không tồn tại!!');", true);
                    }
                }
            }
        }

        public void Insert_Hang(int ID)
        {
            int tblHangHoa_Count = DBDataProvider.DB.hhHangHoas.Where(x => x.IDHangHoa == ID && x.DaXoa == 0).Count();
            if (tblHangHoa_Count > 0)
            {
                var tblHangHoa = DBDataProvider.DB.hhHangHoas.Where(x => x.IDHangHoa == ID && x.DaXoa == 0).FirstOrDefault();
                var exitProdInList = listReceiptProducts.SingleOrDefault(r => r.IDHangHoa == ID);
                if (exitProdInList == null)
                {
                    oImportProduct_ChiTietXuatKhac newChiTiet = new oImportProduct_ChiTietXuatKhac(
                        tblHangHoa.IDHangHoa,
                        tblHangHoa.MaHang,
                        tblHangHoa.TenHangHoa,
                        Convert.ToDouble(tblHangHoa.GiaVon),
                        Convert.ToInt32(tblHangHoa.TonKho),
                        1,
                        Convert.ToDouble(tblHangHoa.GiaVon),
                        3
                        );
                    listReceiptProducts.Add(newChiTiet);
                }
                else
                {
                    exitProdInList.SoLuong += 1;
                    exitProdInList.ThanhTien = exitProdInList.SoLuong * exitProdInList.GiaVon;
                }
                UpdateSTT();
            }
            else
            {
                ccbBarcode.Value = "";
                ccbBarcode.Text = "";
                ccbBarcode.Focus();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã hàng không tồn tại!!');", true);
            }
        }
        #endregion
        protected void dateEditControl_Init(object sender, EventArgs e)
        {
            Formats.InitDateEditControl(sender, e);
        }
        #region bind data hàng hóa
        protected void ccbBarcode_ItemRequestedByValue(object source, DevExpress.Web.ListEditItemRequestedByValueEventArgs e)
        {
            long value = 0;
            if (e.Value == null || !Int64.TryParse(e.Value.ToString(), out value))
                return;
            ASPxComboBox comboBox = (ASPxComboBox)source;
            dsHangHoa.SelectCommand = @"SELECT hhHangHoa.IDHangHoa, hhHangHoa.MaHang, hhHangHoa.TenHangHoa, hhHangHoa.GiaBan,hhHangHoa.GiaVon
                                        FROM hhHangHoa
                                        WHERE (hhHangHoa.IDHangHoa = @IDHangHoa AND hhHangHoa.DaXoa = 0)";
            dsHangHoa.SelectParameters.Clear();
            dsHangHoa.SelectParameters.Add("IDHangHoa", TypeCode.Int64, e.Value.ToString());
            comboBox.DataSource = dsHangHoa;
            comboBox.DataBind();
        }

        protected void ccbBarcode_ItemsRequestedByFilterCondition(object source, DevExpress.Web.ListEditItemsRequestedByFilterConditionEventArgs e)
        {
            ASPxComboBox comboBox = (ASPxComboBox)source;
            dsHangHoa.SelectCommand = @"SELECT [IDHangHoa], [MaHang], [TenHangHoa], [GiaBan] , [GiaVon]
                                        FROM (
	                                        select hhHangHoa.IDHangHoa, hhHangHoa.MaHang, hhHangHoa.TenHangHoa, hhHangHoa.GiaBan,hhHangHoa.GiaVon,
	                                        row_number()over(order by hhHangHoa.MaHang) as [rn] 
	                                        FROM hhHangHoa 
                                                    
	                                        WHERE ((hhHangHoa.MaHang LIKE @MaHang) OR hhHangHoa.TenHangHoa LIKE @TenHang) AND hhHangHoa.DaXoa = 0	
	                                        ) as st 
                                        where st.[rn] between @startIndex and @endIndex";
            dsHangHoa.SelectParameters.Clear();
            dsHangHoa.SelectParameters.Add("MaHang", TypeCode.String, string.Format("%{0}%", e.Filter));
            dsHangHoa.SelectParameters.Add("TenHang", TypeCode.String, string.Format("%{0}%", e.Filter));
            dsHangHoa.SelectParameters.Add("startIndex", TypeCode.Int64, (e.BeginIndex + 1).ToString());
            dsHangHoa.SelectParameters.Add("endIndex", TypeCode.Int64, (e.EndIndex + 1).ToString());
            comboBox.DataSource = dsHangHoa;
            comboBox.DataBind();
        }
        #endregion


        protected void UpdateSTT()
        {
            ccbBarcode.Value = "";
            ccbBarcode.Text = "";
            ccbBarcode.Focus();
            for (int i = 1; i <= listReceiptProducts.Count; i++)
            {
                listReceiptProducts[i - 1].STT = i;
            }

        }
        #region cập nhật số lượng xuất
        protected void spUnitReturn_Init(object sender, EventArgs e)
        {
            ASPxSpinEdit SpinEdit = sender as ASPxSpinEdit;
            GridViewDataRowTemplateContainer container = SpinEdit.NamingContainer as GridViewDataRowTemplateContainer;
            SpinEdit.ClientSideEvents.NumberChanged = String.Format("function(s, e) {{ onUnitReturnChanged({0}); }}", container.KeyValue);
        }
        protected void cbLyDoXuatReturn_Init(object sender, EventArgs e)
        {
            ASPxComboBox ccbEdit = sender as ASPxComboBox;
            GridViewDataRowTemplateContainer container = ccbEdit.NamingContainer as GridViewDataRowTemplateContainer;
            ccbEdit.ClientSideEvents.ValueChanged = String.Format("function(s, e) {{ onUnitReturnChanged({0}); }}", container.KeyValue);
        }

        private void Unitchange(string para)
        {
            int IDProduct = Convert.ToInt32(para);
            //sL
            ASPxSpinEdit SpinEdit = gridImportPro.FindRowCellTemplateControlByKey(IDProduct, (GridViewDataColumn)gridImportPro.Columns["Số lượng"], "spUnitReturn") as ASPxSpinEdit;
            int UnitProductNew = Convert.ToInt32(SpinEdit.Number);
            // lý do
            ASPxComboBox ccbLyDo = gridImportPro.FindRowCellTemplateControlByKey(IDProduct, (GridViewDataColumn)gridImportPro.Columns["Lý do xuất"], "cbLyDoXuat") as ASPxComboBox;
            int ccbLyDoNew = Convert.ToInt32(ccbLyDo.Value);
            
            // cập nhật
            var sourceRow = listReceiptProducts.Where(x => x.STT == IDProduct).SingleOrDefault();
            sourceRow.SoLuong = UnitProductNew;
            sourceRow.LyDoXuatID = ccbLyDoNew;
            sourceRow.ThanhTien = UnitProductNew * sourceRow.GiaVon;
        }
        #endregion

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
            BindGrid();
        }
        private void BindGrid()
        {
            gridImportPro.DataSource = listReceiptProducts;
            gridImportPro.DataBind();
        }

        #region nhập excel
        public string strFileExcel { get; set; }
        protected void UploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            string folder = null;
            string filein = null;
            string ThangNam = null;

            ThangNam = string.Concat(System.DateTime.Now.Month.ToString(), System.DateTime.Now.Year.ToString());
            if (!Directory.Exists(Server.MapPath("~/Uploads/") + ThangNam))
            {
                Directory.CreateDirectory(Server.MapPath("~/Uploads/") + ThangNam);
            }
            folder = Server.MapPath("~/Uploads/" + ThangNam + "/");

            if (UploadControl.HasFile)
            {
                strFileExcel = Guid.NewGuid().ToString();
                string theExtension = Path.GetExtension(UploadControl.FileName);
                strFileExcel += theExtension;
                filein = folder + strFileExcel;
                e.UploadedFile.SaveAs(filein);
                strFileExcel = ThangNam + "/" + strFileExcel;

            }

            //UploadingUtils.RemoveFileWithDelay(uploadedFile.FileName, resFileName, 5);

            string Excel = Server.MapPath("~/Uploads/") + strFileExcel;
            string excelConnectionString = string.Empty;
            excelConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Excel + ";Extended Properties=Excel 8.0;";
            OleDbConnection excelConnection = new OleDbConnection(excelConnectionString);
            OleDbCommand cmd = new OleDbCommand("Select * from [Sheet1$]", excelConnection);
            excelConnection.Open();
            OleDbDataReader dReader = default(OleDbDataReader);
            dReader = cmd.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(dReader);
            int r = dataTable.Rows.Count;
            Import_Temp(dataTable);
            UpdateSTT();
        }
        private void Import_Temp(DataTable datatable)
        {
            int intRow = datatable.Rows.Count;
            if (datatable.Columns.Contains("Mã hàng hóa") && datatable.Columns.Contains("Số lượng") && datatable.Columns.Contains("Giá vốn"))
            {
                if (intRow != 0)
                {
                    for (int i = 0; i <= intRow - 1; i++)
                    {
                        DataRow dr = datatable.Rows[i];
                        string MaHang = dr["Mã hàng hóa"].ToString().Trim();
                        if (MaHang != "")
                        {
                            double GiaVon = Convert.ToDouble(dr["Giá vốn"] == null ? "0" : dr["Giá vốn"].ToString().Trim());
                            int SoLuong = Convert.ToInt32(dr["Số lượng"] == null ? "0" : dr["Số lượng"].ToString().Trim());
                            int tblHangHoa_Count = DBDataProvider.DB.hhHangHoas.Where(x => x.MaHang == MaHang && x.DaXoa == 0).Count();
                            if (tblHangHoa_Count > 0)
                            {
                                var tblHangHoa = DBDataProvider.DB.hhHangHoas.Where(x => x.MaHang == MaHang && x.DaXoa == 0).FirstOrDefault();
                                var exitProdInList = listReceiptProducts.SingleOrDefault(r => r.MaHang == MaHang);
                                if (exitProdInList == null)
                                {
                                    oImportProduct_ChiTietXuatKhac newChiTiet = new oImportProduct_ChiTietXuatKhac(
                                           tblHangHoa.IDHangHoa,
                                           tblHangHoa.MaHang,
                                           tblHangHoa.TenHangHoa,
                                           Convert.ToDouble(tblHangHoa.GiaVon),
                                           Convert.ToInt32(tblHangHoa.TonKho),
                                           1,
                                           GiaVon * SoLuong,
                                           3
                                    );
                                          listReceiptProducts.Add(newChiTiet);
                                }

                            }

                        }
                    }
                }
            }
            else
            {
                Response.Write("<script language='JavaScript'> alert('Dữ liệu không chính xác? Vui lòng kiểm tra lại.'); </script>"); return;
            }
        }
        #endregion



        protected void Save()
        {
            using (var scope = new TransactionScope())
            {
                try
                {
                    double TongTien = 0;
                    int TongSoLuong = 0;
                    foreach (var prod in listReceiptProducts)
                    {
                        TongTien += prod.ThanhTien;
                        TongSoLuong += prod.SoLuong;
                    }

                    double ThanhToan = Convert.ToDouble(spThanhToan.Number);
                    double ConLai = TongTien - ThanhToan;

                    string MaPhieu = null, strMaPhieu = "PN";
                    string MAX = (DBDataProvider.DB.kNhapKhos.Where(r => r.TrangThaiPhieu == 0).Count() + 1).ToString();
                    for (int i = 1; i < (7 - MAX.Length); i++)
                    {
                        strMaPhieu += "0";
                    }
                    MaPhieu = strMaPhieu + MAX;

                    int IDNCC = Int32.Parse(ccbNhaCungCap.Value.ToString());
                    //Insert vào bảng nhập kho
                    kNhapKho nhapKho = new kNhapKho();
                    nhapKho.NCCID = IDNCC;
                    nhapKho.MaPhieu = MaPhieu;
                    nhapKho.SoHoaDon = txtSoHoaDon.Text; ;
                    nhapKho.NgayNhap = Formats.ConvertToDateTime(dateNgayNhap.Text);
                    nhapKho.NguoiNhapID = Formats.IDUser();
                    nhapKho.TongTien = TongTien;
                    nhapKho.TrangThaiPhieu = 0;// 1 phiếu tạm, 2 phiếu xóa, 0 phiếu nhập
                    nhapKho.TongSoLuong = TongSoLuong;
                    nhapKho.GhiChu = memoGhiChu.Text;
                    nhapKho.NgayTao = DateTime.Now;
                    nhapKho.DaXoa = 0;
                    nhapKho.ThanhToan = ThanhToan;
                    nhapKho.CongNo = ConLai;// nợ đơn hàng
                    DBDataProvider.DB.kNhapKhos.InsertOnSubmit(nhapKho);
                    DBDataProvider.DB.SubmitChanges();
                    int IDNhap = nhapKho.IDNhapKho;
                    nhapKho.Url = "TraHang.aspx?id=" + IDNhap;
                    foreach (var prod in listReceiptProducts)
                    {
                        //Insert vào chi tiết nhập kho
                        kNhapKhoChiTiet detailNhapKho = new kNhapKhoChiTiet();
                        detailNhapKho.NhapKhoID = IDNhap;
                        detailNhapKho.HangHoaID = prod.IDHangHoa;
                        detailNhapKho.GiaVon = prod.GiaVon;
                        detailNhapKho.SoLuong = prod.SoLuong;
                        detailNhapKho.ThanhTien = prod.ThanhTien;
                        detailNhapKho.GiaBan = prod.GiaBanMoi;
                        detailNhapKho.TonKho = prod.TonKho;
                        DBDataProvider.DB.kNhapKhoChiTiets.InsertOnSubmit(detailNhapKho);
                        //Cập nhật || Thêm tồn kho
                        var TonKhoBanDau = DBDataProvider.DB.hhHangHoas.Where(x => x.IDHangHoa == prod.IDHangHoa).FirstOrDefault();
                        if (TonKhoBanDau != null)
                        {
                            TonKhoBanDau.TonKho += prod.SoLuong;
                            #region ghi thẻ kho
                            kTheKho thekho = new kTheKho();
                            thekho.NgayNhap = DateTime.Now;
                            thekho.DienGiai = "Nhập hàng #" + MaPhieu;
                            thekho.Nhap = prod.SoLuong;
                            thekho.Xuat = 0;
                            thekho.Ton = prod.SoLuong + prod.TonKho;
                            thekho.HangHoaID = TonKhoBanDau.IDHangHoa;
                            thekho.NhanVienID = Formats.IDUser();
                            DBDataProvider.DB.kTheKhos.InsertOnSubmit(thekho);
                            #endregion
                        }
                        if (prod.GiaBanMoi != prod.GiaBanCu)
                        {
                            // thay đổi giá bán nếu khác giá bán cũ
                            hhHangHoa hang = DBDataProvider.DB.hhHangHoas.Where(x => x.IDHangHoa == prod.IDHangHoa).FirstOrDefault();
                            hang.GiaBan = prod.GiaBanMoi;
                        }
                    }
                    //update công nợ
                    khKhachHang Supplier = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDNCC).FirstOrDefault();
                    if (Supplier != null)
                    {
                        #region ghi nhật ký nhập kho để xem báo cáo
                        if (ConLai > 0)
                        {
                            khNhatKyCongNo nhatky = new khNhatKyCongNo();
                            nhatky.NgayNhap = DateTime.Now;
                            nhatky.DienGiai = "Nhập kho";
                            nhatky.NoDau = Supplier.CongNo;
                            nhatky.NhapHang = ConLai;
                            nhatky.TraHang = 0;
                            nhatky.NoCuoi = Supplier.CongNo + ConLai;
                            nhatky.ThanhToan = 0;
                            nhatky.NhanVienID = Formats.IDUser();
                            nhatky.SoPhieu = MaPhieu;
                            nhatky.IDKhachHang = IDNCC;
                            DBDataProvider.DB.khNhatKyCongNos.InsertOnSubmit(nhatky);
                            DBDataProvider.DB.SubmitChanges();
                        }
                        #endregion
                        nhapKho.CongNoCu = Supplier.CongNo;
                        nhapKho.CongNoMoi = Supplier.CongNo + ConLai;
                        Supplier.TongTienHang += TongTien;
                        Supplier.CongNo += ConLai;
                        Supplier.LanCuoiMuaHang = DateTime.Now;
                    }

                    DBDataProvider.DB.SubmitChanges();
                    scope.Complete();
                    Reset();
                    cbpInfo.JSProperties["cp_Reset"] = true;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}
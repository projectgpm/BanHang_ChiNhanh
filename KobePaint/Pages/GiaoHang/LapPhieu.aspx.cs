using DevExpress.Web;
using DevExpress.XtraReports.UI;
using KobePaint.App_Code;
//using KobePaint.Reports;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.GiaoHang
{
    public partial class LapPhieu : System.Web.UI.Page
    {
        public List<LapPhieuGiaohang> listReceiptProducts
        {
            get
            {
                if (Session["sslistLapPhieuGiaoHang"] == null)
                    Session["sslistLapPhieuGiaoHang"] = new List<LapPhieuGiaohang>();
                return (List<LapPhieuGiaohang>)Session["sslistLapPhieuGiaoHang"];
            }
            set
            {
                Session["sslistLapPhieuGiaoHang"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    string[] infoUser = Context.User.Identity.Name.Split('-');
                    txtNguoiBan.Text = infoUser[1];
                    listReceiptProducts = new List<LapPhieuGiaohang>();
                }
            }
            else
                Response.Redirect("~/Pages/TaiKhoan/DangNhap.aspx");
        }

        

        protected void cbpInfoImport_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string[] para = e.Parameter.Split('|');
            switch (para[0])
            {
                
                case "UnitChange": Unitchange(para[1]); BindGrid(); break;
                case "Save": Save(); Reset(); break;
                case "importexcel": BindGrid(); break;
                case "redirect": DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/Pages/GiaoHang/DanhSachGiaoHang.aspx"); break;
                default: InsertIntoGrid(); BindGrid(); break;
            }
        }
        protected void cbpInfo_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "refresh": Reset(); BindGrid(); break;
                default: break;
            }
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
                    LapPhieuGiaohang newLapPhieuGiaoHang = new LapPhieuGiaohang(
                            tblHangHoa.IDHangHoa,
                            tblHangHoa.MaHang,
                            tblHangHoa.TenHangHoa,
                            Convert.ToDouble(tblHangHoa.GiaVon),
                            Convert.ToInt32(tblHangHoa.TonKho),
                            1,
                             Convert.ToDouble(tblHangHoa.GiaBan),
                             Convert.ToDouble(tblHangHoa.GiaBan)
                        );
                    listReceiptProducts.Add(newLapPhieuGiaoHang);

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



        protected void Reset()
        {
            listReceiptProducts = new List<LapPhieuGiaohang>();
            gridImportPro.DataSource = listReceiptProducts;
            gridImportPro.DataBind();
            memoDiaChiKH.Text = "";
            ccbKhachHang.SelectedIndex = -1;
            ccbKhachHang.Value = "";
            dateNgayGiao.Date = DateTime.Now;
            txtNguoiGiaoHang.Text = "";
            memoDiaChiKH.Text = "";
            ccbBarcode.Text = "";
            ccbBarcode.Value = "";
            ccbBarcode.Focus();

        }

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
                    string MaPhieu = null, strMaPhieu = "PX";
                    string MAX = (DBDataProvider.DB.ghPhieuGiaoHangs.Count() + 1).ToString();
                    for (int i = 1; i < (7 - MAX.Length); i++)
                    {
                        strMaPhieu += "0";
                    }
                    MaPhieu = strMaPhieu + MAX;
                    int IDkhachHang = Int32.Parse(ccbKhachHang.Value.ToString());
                    ghPhieuGiaoHang giaohang = new ghPhieuGiaoHang();
                    giaohang.NgayTao = DateTime.Now;
                    giaohang.MaPhieu = MaPhieu;
                    giaohang.NhanVienID = Formats.IDUser();
                    giaohang.GhiChuGiaoHang = memoDonHang.Text;
                    giaohang.KhachHangID = IDkhachHang;
                    giaohang.NgayGiao = Formats.ConvertToDateTime(dateNgayGiao.Text);
                    giaohang.NguoiGiao = txtNguoiGiaoHang.Text;
                    giaohang.DiaChiGiaoHang = memoDiaChiKH.Text;
                    giaohang.DaXoa = 0;
                    giaohang.TrangThai = 0;// chưa duyệt, 1 đã duyệt
                    giaohang.TongSoLuong = TongSoLuong;
                    giaohang.TongTien = TongTien;
                    DBDataProvider.DB.ghPhieuGiaoHangs.InsertOnSubmit(giaohang);
                    DBDataProvider.DB.SubmitChanges();

                    int IDPhieuGiaoHang = giaohang.IDPhieuGiaoHang;
                    foreach (var prod in listReceiptProducts)
                    {
                        // insert phiếu giao hàng chi tiết
                        ghPhieuGiaoHangChiTiet chitiet = new ghPhieuGiaoHangChiTiet();
                        chitiet.PhieuGiaoHangID = IDPhieuGiaoHang;
                        chitiet.HangHoaID = prod.IDHangHoa;
                        chitiet.TonKho = prod.TonKho;
                        chitiet.SoLuong = prod.SoLuong;
                        chitiet.GiaBan = prod.GiaBan;
                        chitiet.GiaVon = prod.GiaVon;
                        chitiet.ThanhTien = prod.ThanhTien;
                        DBDataProvider.DB.ghPhieuGiaoHangChiTiets.InsertOnSubmit(chitiet);
                        // trừ tạm tồn kho. không ghi công nợ, khi duyệt thì ghi thẻ kho + cộng công nợ khách hàng
                         var TonKhoBanDau = DBDataProvider.DB.hhHangHoas.Where(x => x.IDHangHoa == prod.IDHangHoa).FirstOrDefault();
                         if (TonKhoBanDau != null)
                         {
                             TonKhoBanDau.TonKho -= prod.SoLuong;
                         }
                    }
                    DBDataProvider.DB.SubmitChanges();
                    scope.Complete();
                    Reset();
                    cbpInfoImport.JSProperties["cp_Reset"] = true;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
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
            BindGrid();
        }

       

        #region bind data hàng hóa
        protected void ccbBarcode_ItemRequestedByValue(object source, ListEditItemRequestedByValueEventArgs e)
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

        protected void ccbBarcode_ItemsRequestedByFilterCondition(object source, ListEditItemsRequestedByFilterConditionEventArgs e)
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

        #region cập nhật SL + DG
        protected void spUnitReturn_Init(object sender, EventArgs e)
        {
            ASPxSpinEdit SpinEdit = sender as ASPxSpinEdit;
            GridViewDataRowTemplateContainer container = SpinEdit.NamingContainer as GridViewDataRowTemplateContainer;
            SpinEdit.ClientSideEvents.NumberChanged = String.Format("function(s, e) {{ onUnitReturnChanged({0}); }}", container.KeyValue);
        }
        protected void spGiaBanReturn_Init(object sender, EventArgs e)
        {
            ASPxSpinEdit SpinEdit = sender as ASPxSpinEdit;
            GridViewDataRowTemplateContainer container = SpinEdit.NamingContainer as GridViewDataRowTemplateContainer;
            SpinEdit.ClientSideEvents.NumberChanged = String.Format("function(s, e) {{ onUnitReturnChanged({0}); }}", container.KeyValue);
        }
        

        private void Unitchange(string para)
        {
            int IDProduct = Convert.ToInt32(para);

            //sL
            ASPxSpinEdit SpinEdit = gridImportPro.FindRowCellTemplateControlByKey(IDProduct, (GridViewDataColumn)gridImportPro.Columns["Số lượng"], "spUnitReturn") as ASPxSpinEdit;
            int UnitProductNew = Convert.ToInt32(SpinEdit.Number);
            //Giá bán 
            ASPxSpinEdit SpinEdit_GiaBan = gridImportPro.FindRowCellTemplateControlByKey(IDProduct, (GridViewDataColumn)gridImportPro.Columns["Giá bán"], "spGiaBanReturn") as ASPxSpinEdit;
            double PriceProduct_GiaBan = Convert.ToDouble(SpinEdit_GiaBan.Number);

            // cập nhật
            var sourceRow = listReceiptProducts.Where(x => x.STT == IDProduct).SingleOrDefault();
            sourceRow.SoLuong = UnitProductNew;

            sourceRow.GiaBan = PriceProduct_GiaBan;
            sourceRow.ThanhTien = sourceRow.SoLuong * sourceRow.GiaBan;
        }
        #endregion

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
            if (datatable.Columns.Contains("Mã hàng hóa") && datatable.Columns.Contains("Số lượng")  && datatable.Columns.Contains("Giá bán"))
            {
                if (intRow != 0)
                {
                    for (int i = 0; i <= intRow - 1; i++)
                    {
                        DataRow dr = datatable.Rows[i];
                        string MaHang = dr["Mã hàng hóa"].ToString().Trim();
                        if (MaHang != "")
                        {
                            int tblHangHoa_Count = DBDataProvider.DB.hhHangHoas.Where(x => x.MaHang == MaHang && x.DaXoa == 0).Count();
                            if (tblHangHoa_Count > 0)
                            {
                                double GiaBan = Convert.ToDouble(dr["Giá bán"] == "" ? "0" : dr["Giá bán"].ToString().Trim());
                                int SoLuong = Convert.ToInt32(dr["Số lượng"] == "" ? "0" : dr["Số lượng"].ToString().Trim());
                                var tblHangHoa = DBDataProvider.DB.hhHangHoas.Where(x => x.MaHang == MaHang && x.DaXoa == 0).FirstOrDefault();
                                var exitProdInList = listReceiptProducts.SingleOrDefault(r => r.MaHang == MaHang);
                                if (exitProdInList == null)
                                {

                                    LapPhieuGiaohang newLapPhieuGiaoHang = new LapPhieuGiaohang(
                                            tblHangHoa.IDHangHoa,
                                            tblHangHoa.MaHang,
                                            tblHangHoa.TenHangHoa,
                                            Convert.ToDouble(tblHangHoa.GiaVon),
                                            Convert.ToInt32(tblHangHoa.TonKho),
                                            SoLuong,
                                             SoLuong * GiaBan,
                                             GiaBan
                                        );
                                    listReceiptProducts.Add(newLapPhieuGiaoHang);
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

        protected void dateNgayTao_Init(object sender, EventArgs e)
        {
            Formats.InitDateEditControl(sender, e);
        }

        protected void dateNgayGiao_Init(object sender, EventArgs e)
        {
            Formats.InitDateEditControl(sender, e);
        }

        #region DataBind khách hàng
        protected void ccbKhachHang_ItemRequestedByValue(object source, ListEditItemRequestedByValueEventArgs e)
        {
            long value = 0;
            if (e.Value == null || !Int64.TryParse(e.Value.ToString(), out value))
                return;
            ASPxComboBox comboBox = (ASPxComboBox)source;
            dsKhachHang.SelectCommand = @"SELECT MaKhachHang,HoTen,DienThoai,IDKhachHang
                                        FROM khKhachHang
                                        WHERE (IDKhachHang = @IDKhachHang) AND (DaXoa = 0)";
            dsKhachHang.SelectParameters.Clear();
            dsKhachHang.SelectParameters.Add("IDKhachHang", TypeCode.Int64, e.Value.ToString());
            comboBox.DataSource = dsKhachHang;
            comboBox.DataBind();
        }

        protected void ccbKhachHang_ItemsRequestedByFilterCondition(object source, ListEditItemsRequestedByFilterConditionEventArgs e)
        {
            ASPxComboBox comboBox = (ASPxComboBox)source;
            dsKhachHang.SelectCommand = @"SELECT MaKhachHang,HoTen,DienThoai,IDKhachHang
                                        FROM (
	                                        SELECT MaKhachHang,HoTen,DienThoai,IDKhachHang,
	                                        row_number()over(order by IDKhachHang) as [rn] 
	                                        FROM khKhachHang 
	                                        WHERE ((khKhachHang.MaKhachHang LIKE @MaKhachHang) OR (khKhachHang.HoTen LIKE @HoTen)) AND khKhachHang.DaXoa = 0	
	                                        ) as st 
                                        where st.[rn] between @startIndex and @endIndex";
            dsKhachHang.SelectParameters.Clear();
            dsKhachHang.SelectParameters.Add("MaKhachHang", TypeCode.String, string.Format("%{0}%", e.Filter));
            dsKhachHang.SelectParameters.Add("HoTen", TypeCode.String, string.Format("%{0}%", e.Filter));
            dsKhachHang.SelectParameters.Add("startIndex", TypeCode.Int64, (e.BeginIndex + 1).ToString());
            dsKhachHang.SelectParameters.Add("endIndex", TypeCode.Int64, (e.EndIndex + 1).ToString());
            comboBox.DataSource = dsKhachHang;
            comboBox.DataBind();
        }
        #endregion
    }
}
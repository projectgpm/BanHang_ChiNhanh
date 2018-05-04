namespace KobePaint.Reports
{
    partial class rpPhieuGiaoHangNoPrice
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            DevExpress.DataAccess.Sql.CustomSqlQuery customSqlQuery1 = new DevExpress.DataAccess.Sql.CustomSqlQuery();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(rpPhieuGiaoHangNoPrice));
            this.lblTenCTy = new DevExpress.XtraReports.UI.XRLabel();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.xrTableCell15 = new DevExpress.XtraReports.UI.XRTableCell();
            this.imgLogo = new DevExpress.XtraReports.UI.XRPictureBox();
            this.xrTableCell9 = new DevExpress.XtraReports.UI.XRTableCell();
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
            this.lblPhieuKiemKe = new DevExpress.XtraReports.UI.XRLabel();
            this.lblNguoiNhanHang = new DevExpress.XtraReports.UI.XRLabel();
            this.TongCongNo = new DevExpress.XtraReports.UI.CalculatedField();
            this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
            this.lblDiaChi = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
            this.lblNguoiLapPhieu = new DevExpress.XtraReports.UI.XRLabel();
            this.ChiTietHangBand = new DevExpress.XtraReports.UI.DetailReportBand();
            this.lblNguoiGiaoHang = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel14 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrTable1 = new DevExpress.XtraReports.UI.XRTable();
            this.lblWebsite = new DevExpress.XtraReports.UI.XRLabel();
            this.Detail1 = new DevExpress.XtraReports.UI.DetailBand();
            this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrTableCell2 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell7 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell11 = new DevExpress.XtraReports.UI.XRTableCell();
            this.Detail2 = new DevExpress.XtraReports.UI.DetailBand();
            this.xrTableCell10 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTable2 = new DevExpress.XtraReports.UI.XRTable();
            this.lblMKH = new DevExpress.XtraReports.UI.XRLabel();
            this.DetailReport1 = new DevExpress.XtraReports.UI.DetailReportBand();
            this.xrLabel13 = new DevExpress.XtraReports.UI.XRLabel();
            this.DataThongTin = new DevExpress.DataAccess.Sql.SqlDataSource(this.components);
            this.xrTableCell12 = new DevExpress.XtraReports.UI.XRTableCell();
            this.lblSo = new DevExpress.XtraReports.UI.XRLabel();
            this.xrTableRow2 = new DevExpress.XtraReports.UI.XRTableRow();
            this.lblDienThoai = new DevExpress.XtraReports.UI.XRLabel();
            this.odsPhieuGiaoHang = new DevExpress.DataAccess.ObjectBinding.ObjectDataSource(this.components);
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.Detail3 = new DevExpress.XtraReports.UI.DetailBand();
            this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
            this.xrPageBreak1 = new DevExpress.XtraReports.UI.XRPageBreak();
            this.DetailReport = new DevExpress.XtraReports.UI.DetailReportBand();
            this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
            this.lblPhieuGiaoHang = new DevExpress.XtraReports.UI.XRLabel();
            ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.xrTable2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.odsPhieuGiaoHang)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // lblTenCTy
            // 
            this.lblTenCTy.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.lblTenCTy.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", this.DataThongTin, "ThongTinCongTy.TenCongTy")});
            this.lblTenCTy.Dpi = 100F;
            this.lblTenCTy.Font = new System.Drawing.Font("Times New Roman", 13F, System.Drawing.FontStyle.Bold);
            this.lblTenCTy.LocationFloat = new DevExpress.Utils.PointFloat(137F, 0F);
            this.lblTenCTy.Name = "lblTenCTy";
            this.lblTenCTy.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblTenCTy.SizeF = new System.Drawing.SizeF(480F, 25F);
            this.lblTenCTy.StylePriority.UseBorders = false;
            this.lblTenCTy.StylePriority.UseFont = false;
            this.lblTenCTy.StylePriority.UsePadding = false;
            this.lblTenCTy.StylePriority.UseTextAlignment = false;
            this.lblTenCTy.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // TopMargin
            // 
            this.TopMargin.Dpi = 100F;
            this.TopMargin.HeightF = 25F;
            this.TopMargin.Name = "TopMargin";
            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrTableCell15
            // 
            this.xrTableCell15.Dpi = 100F;
            this.xrTableCell15.Name = "xrTableCell15";
            this.xrTableCell15.Text = "Số lượng";
            this.xrTableCell15.Weight = 0.14244688130359245D;
            // 
            // imgLogo
            // 
            this.imgLogo.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("ImageUrl", this.DataThongTin, "ThongTinCongTy.Logo")});
            this.imgLogo.Dpi = 100F;
            this.imgLogo.LocationFloat = new DevExpress.Utils.PointFloat(6.999938F, 12.08331F);
            this.imgLogo.Name = "imgLogo";
            this.imgLogo.SizeF = new System.Drawing.SizeF(120F, 60F);
            this.imgLogo.Sizing = DevExpress.XtraPrinting.ImageSizeMode.StretchImage;
            // 
            // xrTableCell9
            // 
            this.xrTableCell9.Dpi = 100F;
            this.xrTableCell9.Name = "xrTableCell9";
            this.xrTableCell9.Text = "STT";
            this.xrTableCell9.Weight = 0.081398217887767133D;
            // 
            // Detail
            // 
            this.Detail.Dpi = 100F;
            this.Detail.HeightF = 0F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrLabel3
            // 
            this.xrLabel3.Dpi = 100F;
            this.xrLabel3.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(9.660213F, 227.0833F);
            this.xrLabel3.Name = "xrLabel3";
            this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel3.SizeF = new System.Drawing.SizeF(117.3397F, 23F);
            this.xrLabel3.StylePriority.UseFont = false;
            this.xrLabel3.Text = "Địa chỉ:";
            // 
            // xrLabel9
            // 
            this.xrLabel9.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "CustomerName")});
            this.xrLabel9.Dpi = 100F;
            this.xrLabel9.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(126.9999F, 177.0833F);
            this.xrLabel9.Name = "xrLabel9";
            this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel9.SizeF = new System.Drawing.SizeF(207.9647F, 23F);
            this.xrLabel9.StylePriority.UseFont = false;
            // 
            // lblPhieuKiemKe
            // 
            this.lblPhieuKiemKe.Dpi = 100F;
            this.lblPhieuKiemKe.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Italic);
            this.lblPhieuKiemKe.LocationFloat = new DevExpress.Utils.PointFloat(156.9999F, 135.0833F);
            this.lblPhieuKiemKe.Name = "lblPhieuKiemKe";
            this.lblPhieuKiemKe.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblPhieuKiemKe.SizeF = new System.Drawing.SizeF(440F, 22.99998F);
            this.lblPhieuKiemKe.StylePriority.UseFont = false;
            this.lblPhieuKiemKe.StylePriority.UseTextAlignment = false;
            this.lblPhieuKiemKe.Text = "(Kiêm phiếu xuất kho)";
            this.lblPhieuKiemKe.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // lblNguoiNhanHang
            // 
            this.lblNguoiNhanHang.Dpi = 100F;
            this.lblNguoiNhanHang.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.lblNguoiNhanHang.LocationFloat = new DevExpress.Utils.PointFloat(50.35257F, 10.00001F);
            this.lblNguoiNhanHang.Name = "lblNguoiNhanHang";
            this.lblNguoiNhanHang.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblNguoiNhanHang.SizeF = new System.Drawing.SizeF(124.8397F, 22.99998F);
            this.lblNguoiNhanHang.StylePriority.UseFont = false;
            this.lblNguoiNhanHang.Text = "Người nhận hàng";
            // 
            // TongCongNo
            // 
            this.TongCongNo.DataSource = this.odsPhieuGiaoHang;
            this.TongCongNo.Expression = "[OldDebt] + [TotalOrder]";
            this.TongCongNo.Name = "TongCongNo";
            // 
            // xrTableCell3
            // 
            this.xrTableCell3.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "listProduct.Color")});
            this.xrTableCell3.Dpi = 100F;
            this.xrTableCell3.Name = "xrTableCell3";
            this.xrTableCell3.StylePriority.UseTextAlignment = false;
            this.xrTableCell3.Text = "xrTableCell3";
            this.xrTableCell3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCell3.Weight = 0.15948963317384371D;
            // 
            // lblDiaChi
            // 
            this.lblDiaChi.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.lblDiaChi.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", this.DataThongTin, "ThongTinCongTy.DiaChi")});
            this.lblDiaChi.Dpi = 100F;
            this.lblDiaChi.Font = new System.Drawing.Font("Times New Roman", 10F);
            this.lblDiaChi.LocationFloat = new DevExpress.Utils.PointFloat(137F, 25F);
            this.lblDiaChi.Name = "lblDiaChi";
            this.lblDiaChi.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblDiaChi.SizeF = new System.Drawing.SizeF(480F, 25F);
            this.lblDiaChi.StylePriority.UseBorders = false;
            this.lblDiaChi.StylePriority.UseFont = false;
            this.lblDiaChi.StylePriority.UsePadding = false;
            this.lblDiaChi.StylePriority.UseTextAlignment = false;
            this.lblDiaChi.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabel10
            // 
            this.xrLabel10.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "CustomerPhone")});
            this.xrLabel10.Dpi = 100F;
            this.xrLabel10.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(126.9999F, 201.8847F);
            this.xrLabel10.Name = "xrLabel10";
            this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel10.SizeF = new System.Drawing.SizeF(207.9647F, 22.99998F);
            this.xrLabel10.StylePriority.UseFont = false;
            // 
            // xrLabel1
            // 
            this.xrLabel1.Dpi = 100F;
            this.xrLabel1.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(9.660213F, 177.0833F);
            this.xrLabel1.Name = "xrLabel1";
            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel1.SizeF = new System.Drawing.SizeF(117.3397F, 23F);
            this.xrLabel1.StylePriority.UseFont = false;
            this.xrLabel1.Text = "Tên khách hàng:";
            // 
            // xrLabel4
            // 
            this.xrLabel4.Dpi = 100F;
            this.xrLabel4.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(346.9999F, 201.8847F);
            this.xrLabel4.Name = "xrLabel4";
            this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel4.SizeF = new System.Drawing.SizeF(126.4423F, 23F);
            this.xrLabel4.StylePriority.UseFont = false;
            this.xrLabel4.Text = "Ngày xuất hàng:";
            // 
            // lblNguoiLapPhieu
            // 
            this.lblNguoiLapPhieu.Dpi = 100F;
            this.lblNguoiLapPhieu.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.lblNguoiLapPhieu.LocationFloat = new DevExpress.Utils.PointFloat(441.3781F, 10.00001F);
            this.lblNguoiLapPhieu.Name = "lblNguoiLapPhieu";
            this.lblNguoiLapPhieu.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblNguoiLapPhieu.SizeF = new System.Drawing.SizeF(124.8397F, 22.99998F);
            this.lblNguoiLapPhieu.StylePriority.UseFont = false;
            this.lblNguoiLapPhieu.Text = "Người lập phiếu";
            // 
            // ChiTietHangBand
            // 
            this.ChiTietHangBand.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail1,
            this.DetailReport,
            this.DetailReport1});
            this.ChiTietHangBand.DataSource = this.odsPhieuGiaoHang;
            this.ChiTietHangBand.Dpi = 100F;
            this.ChiTietHangBand.Level = 0;
            this.ChiTietHangBand.Name = "ChiTietHangBand";
            // 
            // lblNguoiGiaoHang
            // 
            this.lblNguoiGiaoHang.Dpi = 100F;
            this.lblNguoiGiaoHang.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.lblNguoiGiaoHang.LocationFloat = new DevExpress.Utils.PointFloat(247.8687F, 10.00001F);
            this.lblNguoiGiaoHang.Name = "lblNguoiGiaoHang";
            this.lblNguoiGiaoHang.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblNguoiGiaoHang.SizeF = new System.Drawing.SizeF(120.8333F, 22.99998F);
            this.lblNguoiGiaoHang.StylePriority.UseFont = false;
            this.lblNguoiGiaoHang.Text = "Người giao hàng";
            // 
            // xrLabel14
            // 
            this.xrLabel14.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "NumOrder")});
            this.xrLabel14.Dpi = 100F;
            this.xrLabel14.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Italic);
            this.xrLabel14.LocationFloat = new DevExpress.Utils.PointFloat(59.99994F, 135.0833F);
            this.xrLabel14.Name = "xrLabel14";
            this.xrLabel14.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel14.SizeF = new System.Drawing.SizeF(93.74998F, 25F);
            this.xrLabel14.StylePriority.UseFont = false;
            this.xrLabel14.StylePriority.UseTextAlignment = false;
            this.xrLabel14.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrTable1
            // 
            this.xrTable1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTable1.Dpi = 100F;
            this.xrTable1.LocationFloat = new DevExpress.Utils.PointFloat(20.00011F, 0F);
            this.xrTable1.Name = "xrTable1";
            this.xrTable1.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
            this.xrTable1.SizeF = new System.Drawing.SizeF(596.9999F, 25F);
            this.xrTable1.StylePriority.UseBorders = false;
            this.xrTable1.StylePriority.UseTextAlignment = false;
            this.xrTable1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // lblWebsite
            // 
            this.lblWebsite.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.lblWebsite.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", this.DataThongTin, "ThongTinCongTy.Website")});
            this.lblWebsite.Dpi = 100F;
            this.lblWebsite.Font = new System.Drawing.Font("Times New Roman", 10F);
            this.lblWebsite.LocationFloat = new DevExpress.Utils.PointFloat(137F, 50F);
            this.lblWebsite.Name = "lblWebsite";
            this.lblWebsite.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblWebsite.SizeF = new System.Drawing.SizeF(480F, 25F);
            this.lblWebsite.StylePriority.UseBorders = false;
            this.lblWebsite.StylePriority.UseFont = false;
            this.lblWebsite.StylePriority.UsePadding = false;
            this.lblWebsite.StylePriority.UseTextAlignment = false;
            this.lblWebsite.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // Detail1
            // 
            this.Detail1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.lblDienThoai,
            this.xrLabel3,
            this.xrLabel2,
            this.xrLabel1,
            this.lblPhieuKiemKe,
            this.xrLabel4,
            this.lblSo,
            this.lblMKH,
            this.imgLogo,
            this.lblTenCTy,
            this.lblDiaChi,
            this.lblWebsite,
            this.lblPhieuGiaoHang,
            this.xrLabel9,
            this.xrLabel10,
            this.xrLabel11,
            this.xrLabel12,
            this.xrLabel13,
            this.xrLabel14,
            this.xrTable2});
            this.Detail1.Dpi = 100F;
            this.Detail1.HeightF = 293.8333F;
            this.Detail1.Name = "Detail1";
            // 
            // xrLabel11
            // 
            this.xrLabel11.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "CustomerAddress")});
            this.xrLabel11.Dpi = 100F;
            this.xrLabel11.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(126.9999F, 227.0833F);
            this.xrLabel11.Name = "xrLabel11";
            this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel11.SizeF = new System.Drawing.SizeF(207.9647F, 23.00002F);
            this.xrLabel11.StylePriority.UseFont = false;
            // 
            // xrTableCell2
            // 
            this.xrTableCell2.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "listProduct.ProductName")});
            this.xrTableCell2.Dpi = 100F;
            this.xrTableCell2.Name = "xrTableCell2";
            this.xrTableCell2.Text = "xrTableCell2";
            this.xrTableCell2.Weight = 0.23758104845992029D;
            // 
            // xrTableCell4
            // 
            this.xrTableCell4.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "listProduct.Measure")});
            this.xrTableCell4.Dpi = 100F;
            this.xrTableCell4.Name = "xrTableCell4";
            this.xrTableCell4.StylePriority.UseTextAlignment = false;
            this.xrTableCell4.Text = "xrTableCell4";
            this.xrTableCell4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCell4.Weight = 0.15948963317384371D;
            // 
            // xrTableCell7
            // 
            this.xrTableCell7.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "listProduct.Unit")});
            this.xrTableCell7.Dpi = 100F;
            this.xrTableCell7.Name = "xrTableCell7";
            this.xrTableCell7.StylePriority.UseTextAlignment = false;
            this.xrTableCell7.Text = "xrTableCell7";
            this.xrTableCell7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight;
            this.xrTableCell7.Weight = 0.14244688130359245D;
            // 
            // xrTableCell11
            // 
            this.xrTableCell11.Dpi = 100F;
            this.xrTableCell11.Name = "xrTableCell11";
            this.xrTableCell11.Text = "Mã số màu";
            this.xrTableCell11.Weight = 0.15948963317384371D;
            // 
            // Detail2
            // 
            this.Detail2.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrTable1});
            this.Detail2.Dpi = 100F;
            this.Detail2.HeightF = 25F;
            this.Detail2.Name = "Detail2";
            // 
            // xrTableCell10
            // 
            this.xrTableCell10.Dpi = 100F;
            this.xrTableCell10.Name = "xrTableCell10";
            this.xrTableCell10.Text = "Tên hàng hóa";
            this.xrTableCell10.Weight = 0.23758104845992029D;
            // 
            // xrTable2
            // 
            this.xrTable2.BackColor = System.Drawing.Color.LightGray;
            this.xrTable2.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTable2.Dpi = 100F;
            this.xrTable2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.xrTable2.LocationFloat = new DevExpress.Utils.PointFloat(20.00014F, 268.8333F);
            this.xrTable2.Name = "xrTable2";
            this.xrTable2.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow2});
            this.xrTable2.SizeF = new System.Drawing.SizeF(596.9999F, 25F);
            this.xrTable2.StylePriority.UseBackColor = false;
            this.xrTable2.StylePriority.UseBorders = false;
            this.xrTable2.StylePriority.UseFont = false;
            this.xrTable2.StylePriority.UseTextAlignment = false;
            this.xrTable2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // lblMKH
            // 
            this.lblMKH.Dpi = 100F;
            this.lblMKH.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Italic);
            this.lblMKH.LocationFloat = new DevExpress.Utils.PointFloat(6.999938F, 110.0833F);
            this.lblMKH.Name = "lblMKH";
            this.lblMKH.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblMKH.SizeF = new System.Drawing.SizeF(53F, 25F);
            this.lblMKH.StylePriority.UseFont = false;
            this.lblMKH.StylePriority.UseTextAlignment = false;
            this.lblMKH.Text = "MKH:";
            this.lblMKH.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight;
            // 
            // DetailReport1
            // 
            this.DetailReport1.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail3});
            this.DetailReport1.Dpi = 100F;
            this.DetailReport1.Level = 1;
            this.DetailReport1.Name = "DetailReport1";
            // 
            // xrLabel13
            // 
            this.xrLabel13.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "CustomerCode")});
            this.xrLabel13.Dpi = 100F;
            this.xrLabel13.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Italic);
            this.xrLabel13.LocationFloat = new DevExpress.Utils.PointFloat(59.99994F, 110.0833F);
            this.xrLabel13.Name = "xrLabel13";
            this.xrLabel13.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel13.SizeF = new System.Drawing.SizeF(93.74998F, 24.99999F);
            this.xrLabel13.StylePriority.UseFont = false;
            this.xrLabel13.StylePriority.UseTextAlignment = false;
            this.xrLabel13.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // DataThongTin
            // 
            this.DataThongTin.ConnectionName = "KobePaintConnectionString";
            this.DataThongTin.Name = "DataThongTin";
            customSqlQuery1.Name = "ThongTinCongTy";
            customSqlQuery1.Sql = resources.GetString("customSqlQuery1.Sql");
            this.DataThongTin.Queries.AddRange(new DevExpress.DataAccess.Sql.SqlQuery[] {
            customSqlQuery1});
            this.DataThongTin.ResultSchemaSerializable = resources.GetString("DataThongTin.ResultSchemaSerializable");
            // 
            // xrTableCell12
            // 
            this.xrTableCell12.Dpi = 100F;
            this.xrTableCell12.Name = "xrTableCell12";
            this.xrTableCell12.Text = "ĐVT";
            this.xrTableCell12.Weight = 0.15948963317384371D;
            // 
            // lblSo
            // 
            this.lblSo.Dpi = 100F;
            this.lblSo.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Italic);
            this.lblSo.LocationFloat = new DevExpress.Utils.PointFloat(6.999938F, 135.0833F);
            this.lblSo.Name = "lblSo";
            this.lblSo.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblSo.SizeF = new System.Drawing.SizeF(53F, 25F);
            this.lblSo.StylePriority.UseFont = false;
            this.lblSo.StylePriority.UseTextAlignment = false;
            this.lblSo.Text = "Số:";
            this.lblSo.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight;
            // 
            // xrTableRow2
            // 
            this.xrTableRow2.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell9,
            this.xrTableCell10,
            this.xrTableCell11,
            this.xrTableCell12,
            this.xrTableCell15});
            this.xrTableRow2.Dpi = 100F;
            this.xrTableRow2.Name = "xrTableRow2";
            this.xrTableRow2.Weight = 11.5D;
            // 
            // lblDienThoai
            // 
            this.lblDienThoai.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.lblDienThoai.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", this.DataThongTin, "ThongTinCongTy.SoDienThoai")});
            this.lblDienThoai.Dpi = 100F;
            this.lblDienThoai.Font = new System.Drawing.Font("Times New Roman", 10F);
            this.lblDienThoai.LocationFloat = new DevExpress.Utils.PointFloat(137F, 75F);
            this.lblDienThoai.Name = "lblDienThoai";
            this.lblDienThoai.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblDienThoai.SizeF = new System.Drawing.SizeF(480F, 25F);
            this.lblDienThoai.StylePriority.UseBorders = false;
            this.lblDienThoai.StylePriority.UseFont = false;
            this.lblDienThoai.StylePriority.UsePadding = false;
            this.lblDienThoai.StylePriority.UseTextAlignment = false;
            this.lblDienThoai.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // odsPhieuGiaoHang
            // 
            this.odsPhieuGiaoHang.DataSourceType = null;
            this.odsPhieuGiaoHang.Name = "odsPhieuGiaoHang";
            // 
            // BottomMargin
            // 
            this.BottomMargin.Dpi = 100F;
            this.BottomMargin.HeightF = 30F;
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // Detail3
            // 
            this.Detail3.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrPageBreak1,
            this.lblNguoiLapPhieu,
            this.lblNguoiNhanHang,
            this.lblNguoiGiaoHang});
            this.Detail3.Dpi = 100F;
            this.Detail3.HeightF = 88.54169F;
            this.Detail3.Name = "Detail3";
            // 
            // xrTableCell1
            // 
            this.xrTableCell1.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "listProduct.STT")});
            this.xrTableCell1.Dpi = 100F;
            this.xrTableCell1.Name = "xrTableCell1";
            this.xrTableCell1.StylePriority.UseTextAlignment = false;
            this.xrTableCell1.Text = "xrTableCell1";
            this.xrTableCell1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCell1.Weight = 0.081398217887767133D;
            // 
            // xrTableRow1
            // 
            this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell2,
            this.xrTableCell3,
            this.xrTableCell4,
            this.xrTableCell7});
            this.xrTableRow1.Dpi = 100F;
            this.xrTableRow1.Name = "xrTableRow1";
            this.xrTableRow1.Weight = 11.5D;
            // 
            // xrPageBreak1
            // 
            this.xrPageBreak1.Dpi = 100F;
            this.xrPageBreak1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 86.54169F);
            this.xrPageBreak1.Name = "xrPageBreak1";
            // 
            // DetailReport
            // 
            this.DetailReport.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail2});
            this.DetailReport.DataMember = "listProduct";
            this.DetailReport.DataSource = this.odsPhieuGiaoHang;
            this.DetailReport.Dpi = 100F;
            this.DetailReport.Level = 0;
            this.DetailReport.Name = "DetailReport";
            // 
            // xrLabel12
            // 
            this.xrLabel12.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "strDispatchDate")});
            this.xrLabel12.Dpi = 100F;
            this.xrLabel12.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(473.4424F, 201.8847F);
            this.xrLabel12.Name = "xrLabel12";
            this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel12.SizeF = new System.Drawing.SizeF(126.4423F, 23F);
            this.xrLabel12.StylePriority.UseFont = false;
            // 
            // xrLabel2
            // 
            this.xrLabel2.Dpi = 100F;
            this.xrLabel2.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(9.660213F, 201.8847F);
            this.xrLabel2.Name = "xrLabel2";
            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel2.SizeF = new System.Drawing.SizeF(117.3397F, 22.99998F);
            this.xrLabel2.StylePriority.UseFont = false;
            this.xrLabel2.Text = "Điện thoại:";
            // 
            // lblPhieuGiaoHang
            // 
            this.lblPhieuGiaoHang.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "SerialOrder")});
            this.lblPhieuGiaoHang.Dpi = 100F;
            this.lblPhieuGiaoHang.Font = new System.Drawing.Font("Times New Roman", 14F, System.Drawing.FontStyle.Bold);
            this.lblPhieuGiaoHang.LocationFloat = new DevExpress.Utils.PointFloat(156.9999F, 110.0833F);
            this.lblPhieuGiaoHang.Name = "lblPhieuGiaoHang";
            this.lblPhieuGiaoHang.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.lblPhieuGiaoHang.SizeF = new System.Drawing.SizeF(440F, 22.99999F);
            this.lblPhieuGiaoHang.StylePriority.UseFont = false;
            this.lblPhieuGiaoHang.StylePriority.UseTextAlignment = false;
            this.lblPhieuGiaoHang.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // rpPhieuGiaoHangNoPrice
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin,
            this.ChiTietHangBand});
            this.CalculatedFields.AddRange(new DevExpress.XtraReports.UI.CalculatedField[] {
            this.TongCongNo});
            this.ComponentStorage.AddRange(new System.ComponentModel.IComponent[] {
            this.DataThongTin,
            this.odsPhieuGiaoHang});
            this.DataMember = "ThongTinCongTy";
            this.DataSource = this.DataThongTin;
            this.Margins = new System.Drawing.Printing.Margins(100, 100, 25, 30);
            this.PageHeight = 1169;
            this.PageWidth = 827;
            this.PaperKind = System.Drawing.Printing.PaperKind.A4;
            this.Version = "16.1";
            ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.xrTable2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.odsPhieuGiaoHang)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }

        #endregion

        private DevExpress.XtraReports.UI.XRLabel lblTenCTy;
        private DevExpress.DataAccess.Sql.SqlDataSource DataThongTin;
        private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell15;
        private DevExpress.XtraReports.UI.XRPictureBox imgLogo;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell9;
        private DevExpress.XtraReports.UI.DetailBand Detail;
        private DevExpress.XtraReports.UI.XRLabel xrLabel3;
        private DevExpress.XtraReports.UI.XRLabel xrLabel9;
        private DevExpress.XtraReports.UI.XRLabel lblPhieuKiemKe;
        private DevExpress.XtraReports.UI.XRLabel lblNguoiNhanHang;
        private DevExpress.XtraReports.UI.CalculatedField TongCongNo;
        private DevExpress.DataAccess.ObjectBinding.ObjectDataSource odsPhieuGiaoHang;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell3;
        private DevExpress.XtraReports.UI.XRLabel lblDiaChi;
        private DevExpress.XtraReports.UI.XRLabel xrLabel10;
        private DevExpress.XtraReports.UI.XRLabel xrLabel1;
        private DevExpress.XtraReports.UI.XRLabel xrLabel4;
        private DevExpress.XtraReports.UI.XRLabel lblNguoiLapPhieu;
        private DevExpress.XtraReports.UI.DetailReportBand ChiTietHangBand;
        private DevExpress.XtraReports.UI.DetailBand Detail1;
        private DevExpress.XtraReports.UI.XRLabel lblDienThoai;
        private DevExpress.XtraReports.UI.XRLabel xrLabel2;
        private DevExpress.XtraReports.UI.XRLabel lblSo;
        private DevExpress.XtraReports.UI.XRLabel lblMKH;
        private DevExpress.XtraReports.UI.XRLabel lblWebsite;
        private DevExpress.XtraReports.UI.XRLabel lblPhieuGiaoHang;
        private DevExpress.XtraReports.UI.XRLabel xrLabel11;
        private DevExpress.XtraReports.UI.XRLabel xrLabel12;
        private DevExpress.XtraReports.UI.XRLabel xrLabel13;
        private DevExpress.XtraReports.UI.XRLabel xrLabel14;
        private DevExpress.XtraReports.UI.XRTable xrTable2;
        private DevExpress.XtraReports.UI.XRTableRow xrTableRow2;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell10;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell11;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell12;
        private DevExpress.XtraReports.UI.DetailReportBand DetailReport;
        private DevExpress.XtraReports.UI.DetailBand Detail2;
        private DevExpress.XtraReports.UI.XRTable xrTable1;
        private DevExpress.XtraReports.UI.XRTableRow xrTableRow1;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell1;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell2;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell4;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell7;
        private DevExpress.XtraReports.UI.DetailReportBand DetailReport1;
        private DevExpress.XtraReports.UI.DetailBand Detail3;
        private DevExpress.XtraReports.UI.XRPageBreak xrPageBreak1;
        private DevExpress.XtraReports.UI.XRLabel lblNguoiGiaoHang;
        private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;

    }
}

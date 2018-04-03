<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ChiTietXuatKho.aspx.cs" Inherits="KobePaint.Pages.BaoCao.ChiTietXuatKho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dxflGroupCell_Material{
            padding: 0 5px;
        }
        .dxflHeadingLineGroupBoxSys.dxflGroupBox_Material > .dxflGroup_Material > tbody > tr:first-child > .dxflGroupCell_Material > .dxflItem_Material, .dxflHeadingLineGroupBoxSys.dxflGroupBox_Material > .dxflGroup_Material > .dxflChildInFirstRowSys > .dxflGroupCell_Material > .dxflItem_Material
        {
            padding-top: 1px;
        }
    </style>
     <script type="text/javascript">
         function AdjustSize() {
             var hformThongTin = formThongTin.GetHeight();
             UpdateHeightControlInPage(gridChiTietXuatKho, hformThongTin);
         }
         function onXemBaoCaoClick() {
             gridChiTietXuatKho.Refresh();
         }
    </script>
    <dx:ASPxFormLayout ID="formThongTin" ClientInstanceName="formThongTin" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Báo cáo xuất kho chi tiết" ColCount="4" HorizontalAlign="Center">
                <Items>
                    <dx:LayoutItem Caption="Từ ngày">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="fromDay" runat="server" OnInit="dateEditControl_Init">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="đến ngày">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="toDay" runat="server" OnInit="dateEditControl_Init">
                                    <DateRangeSettings StartDateEditID="fromDay" />
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Xem báo cáo" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnXemBaoCao" runat="server" Text="Xem báo cáo" AutoPostBack="false">
                                    <ClientSideEvents Click="onXemBaoCaoClick" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Xuất excel" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnXuatExcel" runat="server" Text="Xuất excel" OnClick="btnXuatExcel_Click">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItemCaptions Location="Left" />
            </dx:LayoutGroup>
        </Items>
        <Styles>
            <LayoutItem>
                <Paddings PaddingTop="0px" />
            </LayoutItem>
        </Styles>
    </dx:ASPxFormLayout>
    <dx:ASPxGridView ID="gridChiTietXuatKho" ClientInstanceName="gridChiTietXuatKho" runat="server" AutoGenerateColumns="False" DataSourceID="dsChiTietXuatKho" KeyFieldName="ID" Width="100%" OnCustomColumnDisplayText="gridChiTietXuatKho_CustomColumnDisplayText">
        <Settings VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowHeaderFilterButton="True"/>
        <SettingsBehavior ColumnResizeMode="Control" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image">
            </ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image">
            </HideAdaptiveDetailButton>
        </SettingsCommandButton>
        <SettingsText HeaderFilterCancelButton="Hủy" SearchPanelEditorNullText="Nhập thông tin cần tìm..." CommandBatchEditCancel="Hủy bỏ" CommandBatchEditUpdate="Lưu" PopupEditFormCaption="Cập nhật mã hóa đơn"  EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" ConfirmDelete="Bạn có chắc chắn muốn xóa?" HeaderFilterFrom="Từ" HeaderFilterLastMonth="Tháng trước" HeaderFilterLastWeek="Tuần trước" HeaderFilterLastYear="Năm trước" HeaderFilterNextMonth="Tháng sau" HeaderFilterNextWeek="Tuần sau" HeaderFilterNextYear="Năm sau" HeaderFilterOkButton="Lọc" HeaderFilterSelectAll="Chọn tất cả" HeaderFilterShowAll="Tất cả" HeaderFilterShowBlanks="Trống" HeaderFilterShowNonBlanks="Không trống" HeaderFilterThisMonth="Tháng này" HeaderFilterThisWeek="Tuần này" HeaderFilterThisYear="Năm nay" HeaderFilterTo="Đến" HeaderFilterToday="Hôm nay" HeaderFilterTomorrow="Ngày mai" HeaderFilterYesterday="Ngày hôm qua" />
        <SettingsPager PageSize="20">
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <Columns>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="ID" ReadOnly="True" VisibleIndex="0" Width="50px">
                <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="SoDonHang" VisibleIndex="1" Width="50px">
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày đặt" FieldName="NgayDatHang" VisibleIndex="2">
                <SettingsHeaderFilter>
                    <DateRangeCalendarSettings ClearButtonText="Bỏ" FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" TodayButtonText="Hôm nay" />
                    <DateRangePeriodsSettings ShowWeeksSection="False" />
                </SettingsHeaderFilter>
                <CellStyle HorizontalAlign="Center"></CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    <CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy" TodayButtonText="Hôm nay">
                        <FastNavProperties Enabled="False" />
                    </CalendarProperties>                    
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Ngày xuất" FieldName="NgayXuatHang" VisibleIndex="3">
                <SettingsHeaderFilter>
                    <DateRangeCalendarSettings ClearButtonText="Bỏ" FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" TodayButtonText="Hôm nay" />
                    <DateRangePeriodsSettings ShowWeeksSection="False" />
                </SettingsHeaderFilter>
                <CellStyle HorizontalAlign="Center"></CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    <CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy" TodayButtonText="Hôm nay">
                        <FastNavProperties Enabled="False" />
                    </CalendarProperties>                    
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Số HĐ" FieldName="MaHoaDon" VisibleIndex="4" Width="80px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mã HH" FieldName="MaSo" VisibleIndex="6" >
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <SettingsHeaderFilter Mode="CheckedList"></SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ĐVT" FieldName="QuiCach" VisibleIndex="9" >
                <CellStyle HorizontalAlign="Center"></CellStyle>
                <SettingsHeaderFilter Mode="CheckedList"></SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="SL" FieldName="SoLuong" VisibleIndex="10" >
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Đơn giá" FieldName="DonGia" VisibleIndex="11" Width="90px">
                <CellStyle HorizontalAlign="Right">
                </CellStyle>
                <PropertiesTextEdit DisplayFormatString="N0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Thành tiền" FieldName="ThanhTien" VisibleIndex="12" Width="100px">
                <CellStyle HorizontalAlign="Right">
                </CellStyle>
                <PropertiesTextEdit DisplayFormatString="N0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tên khách hàng" FieldName="HoTen" VisibleIndex="5" Width="150px">
                <SettingsHeaderFilter Mode="CheckedList"></SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tên HH" FieldName="TenHangHoa" VisibleIndex="7" Width="150px">
                <SettingsHeaderFilter Mode="CheckedList"></SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mã màu" FieldName="MaSoMau" VisibleIndex="8">
                <SettingsHeaderFilter Mode="CheckedList"></SettingsHeaderFilter>
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nhân viên" FieldName="HoTenNV" VisibleIndex="13" Width="120px">
                <SettingsHeaderFilter Mode="CheckedList"></SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="Tổng: {0:N0}" FieldName="ThanhTien" ShowInColumn="Thành tiền" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="Tổng SL: {0}" FieldName="SoLuong" ShowInColumn="SL" SummaryType="Sum" />
        </TotalSummary>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsChiTietXuatKho" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
        SelectCommand="SELECT gChiTietGiaoHang.ID, gPhieuGiaoHang.SoDonHang, gPhieuGiaoHang.NgayDatHang, gPhieuGiaoHang.NgayXuatHang, gPhieuGiaoHang.MaHoaDon, hhHangHoa.MaSo, hhHangHoa.QuiCach, gChiTietGiaoHang.SoLuong, gChiTietGiaoHang.DonGia, gChiTietGiaoHang.ThanhTien, hhHangHoa.TenHangHoa, hhMaSoMau.MaSoMau, khKhachHang.HoTen, nvNhanVien.HoTen AS HoTenNV FROM gChiTietGiaoHang INNER JOIN gPhieuGiaoHang ON gChiTietGiaoHang.PhieuGiaoHangID = gPhieuGiaoHang.IDPhieuGiaoHang INNER JOIN hhHangHoa ON gChiTietGiaoHang.HangHoaID = hhHangHoa.IDHangHoa INNER JOIN hhMaSoMau ON gChiTietGiaoHang.MaSoMauID = hhMaSoMau.IDMaMau INNER JOIN khKhachHang ON gPhieuGiaoHang.KhachHangID = khKhachHang.IDKhachHang INNER JOIN nvNhanVien ON gPhieuGiaoHang.NhanVienLapID = nvNhanVien.IDNhanVien WHERE (gPhieuGiaoHang.PheDuyet = 1) AND (gPhieuGiaoHang.NgayXuatHang &gt;= @TuNgay) AND (gPhieuGiaoHang.NgayXuatHang &lt;= DATEADD(day, 1, @DenNgay)) ORDER BY gPhieuGiaoHang.NgayXuatHang, gChiTietGiaoHang.ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="formThongTin$fromDay" Name="TuNgay" PropertyName="Value" />
            <asp:ControlParameter ControlID="formThongTin$toDay" Name="DenNgay" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
    </dx:ASPxGlobalEvents>       
    <dx:ASPxGridViewExporter ID="exporterGrid" runat="server" GridViewID="gridChiTietXuatKho">
    </dx:ASPxGridViewExporter>
</asp:Content>

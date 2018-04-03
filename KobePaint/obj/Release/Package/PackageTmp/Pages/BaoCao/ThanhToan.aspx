<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="KobePaint.Pages.BaoCao.ThanhToan" %>
<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function onPrintClick(idPhieu) {
            popupViewReport.Show();
            cbpViewReport.PerformCallback(idPhieu);
        }
        function onEndCallBackViewRp(s, e) {
            if (s.cpSelect) {
                gridThanhToan.Refresh();
                delete (s.cpSelect);
            }
            else {                
                reportViewer.GetViewer().Refresh();
            }
        }
        function AdjustSize() {
            var hformThongTin = formThongTin.GetHeight();
            UpdateHeightControlInPage(gridThanhToan, hformThongTin);
        }
        function onXemBaoCaoClick() {
            cbpViewReport.PerformCallback('Select');
        }
    </script>
    <dx:ASPxFormLayout ID="formThongTin" ClientInstanceName="formThongTin" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Báo cáo thanh toán" ColCount="6" HorizontalAlign="Center" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nhóm khách hàng">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ccbLoaiKH" ClientInstanceName="ccbLoaiKH" runat="server" DataSourceID="dsLoaiKH" TextField="TenLoaiKhachHang" ValueField="IDLoaiKhachHang" NullText="Chọn nhóm" SelectedIndex="0" Width="100%">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { ccbKhachHang.PerformCallback(); }" />
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="dsLoaiKH" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT 0 as IDLoaiKhachHang, N'Tất cả' as TenLoaiKhachHang UNION ALL SELECT [IDLoaiKhachHang], [TenLoaiKhachHang] FROM [khLoaiKhachHang] WHERE ([DaXoa] = 0) AND [IDLoaiKhachHang] <> 1"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Khách hàng">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ccbKhachHang" ClientInstanceName="ccbKhachHang" runat="server" DataSourceID="dsKhachHangTheoLoai" DisplayFormatString="{0}" TextField="HoTen" ValueField="IDKhachHang" OnCallback="ccbKhachHang_Callback" SelectedIndex="0" Width="100%">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Họ tên" FieldName="HoTen" />
                                        <dx:ListBoxColumn Caption="Điện thoại" FieldName="DienThoai" />
                                    </Columns>                                    
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="dsKhachHangTheoLoai" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT 0 as IDKhachHang, N'Tất cả' as HoTen, '' as DienThoai UNION ALL SELECT [IDKhachHang], [HoTen], [DienThoai] FROM [khKhachHang] WHERE (@LoaiKhachHangID = 0 OR [LoaiKhachHangID] = @LoaiKhachHangID) AND [LoaiKhachHangID] <> 1">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="formThongTin$ccbLoaiKH" Name="LoaiKhachHangID" PropertyName="Value" Type="Int32" DefaultValue="0" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Từ ngày">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="fromDay" runat="server" OnInit="dateEditControl_Init" Width="100%">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="đến ngày">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="toDay" runat="server" OnInit="dateEditControl_Init" Width="100%">
                                    <DateRangeSettings StartDateEditID="fromDay" />
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Xem báo cáo" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnXemBaoCao" runat="server" Text="Xem báo cáo" AutoPostBack="false" Width="100%">
                                    <ClientSideEvents Click="onXemBaoCaoClick" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Xuất excel" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnXuatExcel" runat="server" Text="Xuất excel" OnClick="btnXuatExcel_Click" Width="100%">
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
    
    <dx:ASPxGridView ID="gridThanhToan" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridThanhToan" DataSourceID="dsPhieuThu" KeyFieldName="IDPhieuThu" Width="100%" OnBeforePerformDataSelect="gridThanhToan_BeforePerformDataSelect">
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="0" ShowFilterRow="True" ShowFooter="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="true"/>
        <SettingsBehavior AutoExpandAllGroups="True" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image">
            </ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image">
            </HideAdaptiveDetailButton>
            <UpdateButton RenderMode="Image">
                <Image IconID="save_save_32x32" ToolTip="Lưu tất cả thay đổi">
                </Image>
            </UpdateButton>
            <CancelButton RenderMode="Image">
                <Image IconID="actions_close_32x32">
                </Image>
            </CancelButton>
            <EditButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_edit_16x16devav">
                </Image>
            </EditButton>
        </SettingsCommandButton>
        <SettingsPager PageSize="30" AlwaysShowPager="True" >
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <SettingsText EmptyDataRow="Không có dữ liệu !!" HeaderFilterCancelButton="Hủy" HeaderFilterFrom="Từ" HeaderFilterOkButton="Lọc" HeaderFilterTo="Đến" SearchPanelEditorNullText="Nhập thông tin cần tìm..." CommandBatchEditCancel="Hủy bỏ" CommandBatchEditUpdate="Lưu" PopupEditFormCaption="Cập nhật mã hóa đơn" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IDPhieuThu" ReadOnly="True" Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="STTPhieuThu" SortIndex="0" SortOrder="Ascending" VisibleIndex="1" Width="50px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Hóa đơn" FieldName="SoHoaDon" VisibleIndex="2" Width="120px">
                <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Số tiền thu" FieldName="SoTienThu" VisibleIndex="6" Width="120px">
                <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nội dung" FieldName="NoiDung" VisibleIndex="5">
                <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày thu" FieldName="NgayThu" VisibleIndex="3" Width="100px">
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    <CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy">
                        <FastNavProperties Enabled="False" />
                    </CalendarProperties>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Khách hàng" FieldName="KhachHangID" GroupIndex="0" SortIndex="0" SortOrder="Ascending" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="dsKhachHang" TextField="HoTen" ValueField="IDKhachHang">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Nhân viên thu" FieldName="NhanVienThuID" VisibleIndex="7" Width="150px">
                <PropertiesComboBox DataSourceID="dsNhanVien" TextField="HoTen" ValueField="IDNhanVien">
                </PropertiesComboBox>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="In phiếu" VisibleIndex="9" Width="80px">
                <DataItemTemplate>
                    <dx:ASPxButton ID="btnInPhieu" runat="server" RenderMode="Link" OnInit="btnInPhieu_Init" AutoPostBack="false">
                        <Image IconID="print_print_16x16">
                        </Image>
                    </dx:ASPxButton>
                </DataItemTemplate>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Loại TT" FieldName="HinhThucTTID" VisibleIndex="8" Width="200px">
                <PropertiesComboBox DataSourceID="dsLoaiTT" TextField="TenHinhThuc" ValueField="IDHinhThucTT">
                </PropertiesComboBox>
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="Tổng: {0:N0}" FieldName="SoTienThu" ShowInColumn="Số tiền thu" SummaryType="Sum" />
        </TotalSummary>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsPhieuThu" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDPhieuThu], [STTPhieuThu], [SoHoaDon], [KhachHangID], [SoTienThu], [NoiDung], [NgayThu], [NhanVienThuID], [HinhThucTTID] FROM [gPhieuThu]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsLoaiTT" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDHinhThucTT], [TenHinhThuc] FROM [gHinhThucThanhToan]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien]"></asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
    </dx:ASPxGlobalEvents>
    <dx:ASPxPopupControl ID="popupViewReport" ClientInstanceName="popupViewReport" runat="server" HeaderText="Phiếu xuất hàng" Width="800px" Height="600px" PopupHorizontalAlign="WindowCenter" ScrollBars="Auto" >
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxCallbackPanel ID="cbpViewReport" ClientInstanceName="cbpViewReport" runat="server" Width="100%" OnCallback="cbpViewReport_Callback">
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxDocumentViewer ID="reportViewer" ClientInstanceName="reportViewer" runat="server" Width="100%">
                            </dx:ASPxDocumentViewer>                
                            <dx:ASPxHiddenField ID="hdfViewReport" ClientInstanceName="hdfViewReport" runat="server">
                            </dx:ASPxHiddenField>
                        </dx:PanelContent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="onEndCallBackViewRp" />
                </dx:ASPxCallbackPanel>                
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxGridViewExporter ID="exporterGrid" runat="server" GridViewID="gridThanhToan">
    </dx:ASPxGridViewExporter>
</asp:Content>

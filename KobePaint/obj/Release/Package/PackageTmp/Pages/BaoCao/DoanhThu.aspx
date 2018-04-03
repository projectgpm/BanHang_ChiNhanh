<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="DoanhThu.aspx.cs" Inherits="KobePaint.Pages.BaoCao.DoanhThu" %>
<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function onPrintClick(idPhieu) {
            popupViewReport.Show();
            cbpViewReport.PerformCallback(idPhieu);
        }
        function onEndCallBackViewRp(s, e) {
            if (s.cpSelect) {
                gridDonHang.Refresh();
                delete (s.cpSelect);
            }
            else {
                hdfViewReport.Set('view', '1');
                reportViewer.GetViewer().Refresh();
            }
        }
        function onTabChanged(s, e) {
            if (e.tab.name == 'CoGia') {
                hdfViewReport.Set('view', '1');
                reportViewer.GetViewer().Refresh();
            }
            else {
                hdfViewReport.Set('view', '2');
                reportViewer.GetViewer().Refresh();
            }
        }
        function onXemBaoCaoClick()
        {
            cbpViewReport.PerformCallback('Select');
        }
        function AdjustSize() {
            var hformThongTin = formThongTin.GetHeight();
            UpdateHeightControlInPage(gridDonHang, hformThongTin);
        }
    </script>
    <dx:ASPxFormLayout ID="formThongTin" ClientInstanceName="formThongTin" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Báo cáo doanh thu bán hàng" ColCount="6" HorizontalAlign="Center" Width="100%">
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
    <dx:ASPxGridView ID="gridDonHang" ClientInstanceName="gridDonHang" runat="server" AutoGenerateColumns="False" DataSourceID="dsDonHang" KeyFieldName="IDPhieuGiaoHang" Width="100%" OnCustomColumnDisplayText="gridDonHang_CustomColumnDisplayText" OnBeforePerformDataSelect="gridDonHang_BeforePerformDataSelect">
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
        </SettingsEditing>
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="0" ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways"/>
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
        <SettingsDetail ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="gridChiTietHang" runat="server" AutoGenerateColumns="False" DataSourceID="dsChiTietDonHang" KeyFieldName="ID" OnBeforePerformDataSelect="gridChiTietHang_BeforePerformDataSelect" OnCustomColumnDisplayText="gridChiTietHang_CustomColumnDisplayText" Width="100%">
                    <settings showtitlepanel="True" />
                    <settingstext title="CHI TIẾT GIAO HÀNG" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <SettingsCommandButton>
                        <ShowAdaptiveDetailButton ButtonType="Image">
                        </ShowAdaptiveDetailButton>
                        <HideAdaptiveDetailButton ButtonType="Image">
                        </HideAdaptiveDetailButton>
                    </SettingsCommandButton>
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="STT" FieldName="ID" ReadOnly="True" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Hàng hóa" FieldName="TenHangHoa" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mã màu" FieldName="MaSoMau" VisibleIndex="3">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mã số" FieldName="MaSo" VisibleIndex="2">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ĐVT" FieldName="QuiCach" VisibleIndex="4">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Số lượng" FieldName="SoLuong" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Đơn giá" FieldName="DonGia" VisibleIndex="6">
                            <PropertiesTextEdit DisplayFormatString="N0">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="CK" FieldName="ChietKhau" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Thành tiền" FieldName="ThanhTien" VisibleIndex="8">
                            <PropertiesTextEdit DisplayFormatString="N0">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Styles>
                        <Header HorizontalAlign="Center" forecolor="#009933">
                            <Border BorderStyle="Dashed" />
                        </Header>
                        <Cell>
                            <Border BorderStyle="Dashed" />
                        </Cell>
                        <titlepanel font-bold="True" font-size="13px" forecolor="#009933" BackColor="#F4F4F4">
                        </titlepanel>
                    </Styles>
                    <Border BorderColor="Silver" BorderStyle="Solid" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsChiTietDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT gChiTietGiaoHang.ID, hhHangHoa.TenHangHoa, hhMaSoMau.MaSoMau, hhHangHoa.MaSo, hhHangHoa.QuiCach, gChiTietGiaoHang.SoLuong, gChiTietGiaoHang.DonGia, gChiTietGiaoHang.ChietKhau, gChiTietGiaoHang.ThanhTien FROM gChiTietGiaoHang INNER JOIN hhHangHoa ON gChiTietGiaoHang.HangHoaID = hhHangHoa.IDHangHoa INNER JOIN hhMaSoMau ON gChiTietGiaoHang.MaSoMauID = hhMaSoMau.IDMaMau WHERE (gChiTietGiaoHang.PhieuGiaoHangID = @IDPhieuGiaoHang)">
                    <SelectParameters>
                        <asp:SessionParameter Name="IDPhieuGiaoHang" SessionField="IDPhieuGiaoHang" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </DetailRow>
        </Templates>
        <SettingsPager PageSize="30" AlwaysShowPager="True" >
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <SettingsText HeaderFilterCancelButton="Hủy" SearchPanelEditorNullText="Nhập thông tin cần tìm..." CommandBatchEditCancel="Hủy bỏ" CommandBatchEditUpdate="Lưu" PopupEditFormCaption="Cập nhật mã hóa đơn"  EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" ConfirmDelete="Bạn có chắc chắn muốn xóa?" HeaderFilterFrom="Từ" HeaderFilterLastMonth="Tháng trước" HeaderFilterLastWeek="Tuần trước" HeaderFilterLastYear="Năm trước" HeaderFilterNextMonth="Tháng sau" HeaderFilterNextWeek="Tuần sau" HeaderFilterNextYear="Năm sau" HeaderFilterOkButton="Lọc" HeaderFilterSelectAll="Chọn tất cả" HeaderFilterShowAll="Tất cả" HeaderFilterShowBlanks="Trống" HeaderFilterShowNonBlanks="Không trống" HeaderFilterThisMonth="Tháng này" HeaderFilterThisWeek="Tuần này" HeaderFilterThisYear="Năm nay" HeaderFilterTo="Đến" HeaderFilterToday="Hôm nay" HeaderFilterTomorrow="Ngày mai" HeaderFilterYesterday="Ngày hôm qua" />
        <Columns>
            <dx:GridViewCommandColumn Caption="Cập nhật HĐ" ShowEditButton="True" VisibleIndex="12">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="IDPhieuGiaoHang" ReadOnly="True" VisibleIndex="0" Width="40px">
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Số đơn hàng" FieldName="SoDonHang" VisibleIndex="7">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày đặt hàng" FieldName="NgayDatHang" VisibleIndex="2" Width="130px">
                <settings allowheaderfilter="True" />
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    <CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy">
                        <FastNavProperties Enabled="False" />
                    </CalendarProperties>
                </PropertiesDateEdit>
                <SettingsHeaderFilter>
                    <DateRangeCalendarSettings ShowClearButton="False" ShowTodayButton="False" />
                    <DateRangePickerSettings DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" />
                    <DateRangePeriodsSettings ShowDaysSection="False" ShowFuturePeriods="False" ShowMonthsSection="False" ShowPastPeriods="False" ShowPresentPeriods="False" ShowWeeksSection="False" ShowYearsSection="False" />
                </SettingsHeaderFilter>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Ngày xuất hàng" FieldName="NgayXuatHang" VisibleIndex="3" Width="130px">
                <settings allowheaderfilter="True" />
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    <CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy">
                        <FastNavProperties Enabled="False" />
                    </CalendarProperties>
                </PropertiesDateEdit>
                <SettingsHeaderFilter>
                    <DateRangeCalendarSettings ShowClearButton="False" ShowTodayButton="False" />
                    <DateRangePickerSettings DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" />
                    <DateRangePeriodsSettings ShowDaysSection="False" ShowFuturePeriods="False" ShowMonthsSection="False" ShowPastPeriods="False" ShowPresentPeriods="False" ShowWeeksSection="False" ShowYearsSection="False" />
                </SettingsHeaderFilter>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Ghi chú" FieldName="GhiChu" VisibleIndex="11">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="NV Đặt hàng" FieldName="NhanVienLapID" VisibleIndex="10">
                <PropertiesComboBox DataSourceID="dsNhanVien" TextField="HoTen" ValueField="IDNhanVien">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
                <Settings AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Khách hàng" FieldName="KhachHangID" VisibleIndex="1" ReadOnly="True" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                <PropertiesComboBox DataSourceID="dsKhachHang" TextField="HoTen" ValueField="IDKhachHang">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataSpinEditColumn Caption="Tổng tiền" FieldName="TongTienHang" VisibleIndex="8" ReadOnly="True">
                <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatString="N0" NumberFormat="Custom">
                </PropertiesSpinEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataSpinEditColumn Caption="Số lượng hàng" FieldName="TongSoLuong" VisibleIndex="9">
                <PropertiesSpinEdit DisplayFormatString="g" NumberType="Integer">
                </PropertiesSpinEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataTextColumn Caption="Hóa đơn" VisibleIndex="4" FieldName="MaHoaDon">
                <EditFormSettings Visible="True" />
                <FooterTemplate>
                    TỔNG:
                </FooterTemplate>
                <GroupFooterTemplate>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="TỔNG" ForeColor="#009933">
                    </dx:ASPxLabel>
                </GroupFooterTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="In phiếu" VisibleIndex="13">
                <DataItemTemplate>
                    <dx:ASPxButton ID="btnInPhieu" runat="server" RenderMode="Link" OnInit="btnInPhieu_Init" AutoPostBack="false">
                        <Image IconID="print_print_16x16">
                        </Image>
                    </dx:ASPxButton>
                </DataItemTemplate>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:N0}" FieldName="TongTienHang" ShowInColumn="Tổng tiền" ShowInGroupFooterColumn="Tổng tiền" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0}" FieldName="TongSoLuong" ShowInColumn="Số lượng hàng" ShowInGroupFooterColumn="Số lượng hàng" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0}" FieldName="SoDonHang" ShowInColumn="Số đơn hàng" ShowInGroupFooterColumn="Số đơn hàng" SummaryType="Count" />
        </TotalSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:N0}" FieldName="TongTienHang" ShowInGroupFooterColumn="Tổng tiền" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0}" FieldName="TongSoLuong" ShowInGroupFooterColumn="Số lượng hàng" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0}" FieldName="SoDonHang" ShowInGroupFooterColumn="Số đơn hàng" SummaryType="Count" />
        </GroupSummary>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <GroupRow Font-Bold="True" ForeColor="#009933">
            </GroupRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
        SelectCommand="SELECT [IDPhieuGiaoHang], [KhachHangID], [STTDonHang], [SoDonHang], [NgayDatHang], [NgayXuatHang], [XeID], [TaiXeID], [GhiChu], [TongTienHang], [TongSoLuong], [PheDuyet], [NhanVienLapID], [MaHoaDon] FROM [gPhieuGiaoHang] WHERE [PheDuyet] = 1" 
        UpdateCommand="UPDATE gPhieuGiaoHang SET MaHoaDon = @MaHoaDon WHERE (IDPhieuGiaoHang = @IDPhieuGiaoHang)">
        <UpdateParameters>
            <asp:Parameter Name="MaHoaDon" Type="String" />
            <asp:Parameter Name="IDPhieuGiaoHang" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien] WHERE [DaXoa] = 0 AND [NhomID] <> 5"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE [DaXoa] = 0"></asp:SqlDataSource>
    <dx:ASPxPopupControl ID="popupViewReport" ClientInstanceName="popupViewReport" runat="server" HeaderText="Phiếu xuất hàng" Width="800px" Height="600px" ScrollBars="Auto" PopupHorizontalAlign="WindowCenter" >
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxCallbackPanel ID="cbpViewReport" ClientInstanceName="cbpViewReport" runat="server" Width="100%" OnCallback="cbpViewReport_Callback">
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxTabControl ID="ASPxTabControl1" runat="server" ActiveTabIndex="0">
                                <tabs>
                                    <dx:Tab Text="Phiếu giao hàng" Name="CoGia">
                                    </dx:Tab>
                                    <dx:Tab Text="Phiếu giao hàng (không có giá bán)" Name="KhongGia">
                                    </dx:Tab>
                                </tabs>
                                <clientsideevents activetabchanged="onTabChanged" />
                                <tabstyle>
                                    <paddings padding="5px" />
                                </tabstyle>
                                <ActiveTabStyle Font-Bold="True" ForeColor="#1F77C0">
                                </ActiveTabStyle>
                            </dx:ASPxTabControl>
                            <dx:ASPxDocumentViewer ID="reportViewer" ClientInstanceName="reportViewer" runat="server">
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
    <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
        <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
    </dx:ASPxGlobalEvents>
    <dx:ASPxGridViewExporter ID="exporterGrid" runat="server" GridViewID="gridDonHang">
    </dx:ASPxGridViewExporter>
</asp:Content>

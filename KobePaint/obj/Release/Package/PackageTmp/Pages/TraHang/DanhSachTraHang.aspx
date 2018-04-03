<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="DanhSachTraHang.aspx.cs" Inherits="KobePaint.Pages.TraHang.DanhSachTraHang" %>
<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function onPrintClick(idPhieu) {
            popupViewReport.Show();
            cbpViewReport.PerformCallback(idPhieu);
        }
        function onEndCallBackViewRp() {
            hdfViewReport.Set('view', '1');
            reportViewer.GetViewer().Refresh();
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
    </script>
    <dx:ASPxGridView ID="gridTraHang" ClientInstanceName="gridTraHang" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="dsTraHang" KeyFieldName="IDPhieuTraHang" OnCustomColumnDisplayText="gridTraHang_CustomColumnDisplayText">
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="500" ShowFilterRow="false"/>
        <SettingsDetail ShowDetailRow="True" />
        <SettingsBehavior AutoExpandAllGroups="True" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image">
            </ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image">
            </HideAdaptiveDetailButton>
            <UpdateButton>
                <Image IconID="save_save_32x32" ToolTip="Lưu tất cả thay đổi">
                </Image>
            </UpdateButton>
            <CancelButton>
                <Image IconID="actions_close_32x32">
                </Image>
            </CancelButton>
        </SettingsCommandButton>
        <SettingsPager PageSize="30" AlwaysShowPager="True" >
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <SettingsText EmptyDataRow="Không có dữ liệu !!" HeaderFilterCancelButton="Hủy" HeaderFilterFrom="Từ" HeaderFilterOkButton="Lọc" HeaderFilterTo="Đến" SearchPanelEditorNullText="Nhập thông tin cần tìm..." CommandBatchEditCancel="Hủy bỏ" CommandBatchEditUpdate="Lưu" />
        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="gridChiTietHang" runat="server" AutoGenerateColumns="False" DataSourceID="dsChiTietHang" KeyFieldName="ID" OnBeforePerformDataSelect="gridChiTietHang_BeforePerformDataSelect" OnCustomColumnDisplayText="gridChiTietHang_CustomColumnDisplayText"  Width="100%">
                    <settings showtitlepanel="True" />
                    <settingstext title="CHI TIẾT HÀNG TRẢ" />
                    <SettingsCommandButton>
                        <ShowAdaptiveDetailButton ButtonType="Image">
                        </ShowAdaptiveDetailButton>
                        <HideAdaptiveDetailButton ButtonType="Image">
                        </HideAdaptiveDetailButton>
                    </SettingsCommandButton>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Caption="STT">
                            <EditFormSettings Visible="False" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TenHangHoa" VisibleIndex="1" Caption="Hàng hóa">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MaSoMau" VisibleIndex="3" Caption="Mã màu">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SoLuongTra" VisibleIndex="6" Caption="SL Trả">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DonGia" VisibleIndex="7" Caption="Đơn giá">
                            <CellStyle HorizontalAlign="Right">
                            </CellStyle>
                            <PropertiesTextEdit DisplayFormatString="N0">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ThanhTienTra" VisibleIndex="9" Caption="Thành tiền">
                            <CellStyle HorizontalAlign="Right">
                            </CellStyle>
                            <PropertiesTextEdit DisplayFormatString="N0">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PhieuTraHangID" VisibleIndex="10" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mã số" FieldName="MaSo" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ĐVT" FieldName="QuiCach" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="SL Bán" FieldName="SoLuong" VisibleIndex="5">
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
                <asp:SqlDataSource ID="dsChiTietHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT gChiTietTraHang.ID, gChiTietTraHang.PhieuTraHangID, gChiTietGiaoHang.HangHoaID, gChiTietGiaoHang.MaSoMauID, gChiTietGiaoHang.DonGia, hhHangHoa.TenHangHoa, hhMaSoMau.MaSoMau, hhHangHoa.MaSo, hhHangHoa.QuiCach, gChiTietTraHang.ChiTietGiaoHangID, gChiTietTraHang.SoLuongTra, gChiTietTraHang.ThanhTienTra, gChiTietGiaoHang.SoLuong, gChiTietGiaoHang.ChietKhau FROM hhHangHoa INNER JOIN gChiTietGiaoHang ON hhHangHoa.IDHangHoa = gChiTietGiaoHang.HangHoaID INNER JOIN hhMaSoMau ON gChiTietGiaoHang.MaSoMauID = hhMaSoMau.IDMaMau INNER JOIN gChiTietTraHang ON gChiTietGiaoHang.ID = gChiTietTraHang.ChiTietGiaoHangID WHERE (gChiTietTraHang.PhieuTraHangID = @PhieuTraHangID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="PhieuTraHangID" SessionField="IDPhieuTra" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </DetailRow>
        </Templates>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IDPhieuTraHang" ReadOnly="True" VisibleIndex="0" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="STTPhieuTraHang" VisibleIndex="1" Caption="STT">
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="KhachHangID" VisibleIndex="2" Caption="Khách hàng" ReadOnly="true" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                <PropertiesComboBox DataSourceID="dsKhachHang" TextField="HoTen" ValueField="IDKhachHang">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="NgayTra" VisibleIndex="3" Caption="Ngày trả">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    <CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy">
                        <FastNavProperties Enabled="False" />
                    </CalendarProperties>
                </PropertiesDateEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="NgayLuuKho" VisibleIndex="4" Caption="Ngày lưu kho">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    <CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy">
                        <FastNavProperties Enabled="False" />
                    </CalendarProperties>
                </PropertiesDateEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="GhiChu" VisibleIndex="7" Caption="Ghi chú">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TongTienHang" VisibleIndex="6" Caption="Tổng tiền" ReadOnly="true">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TongSoLuong" VisibleIndex="5" Caption="Số lượng">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Nhân viên" FieldName="NhanVienLapID" VisibleIndex="8">
                <PropertiesComboBox DataSourceID="dsNhanVien" TextField="HoTen" ValueField="IDNhanVien">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="In phiếu" VisibleIndex="9">
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
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <GroupRow Font-Bold="True" ForeColor="#009933">
            </GroupRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsTraHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDPhieuTraHang], [STTPhieuTraHang], [KhachHangID], [NgayTra], [NgayLuuKho], [GhiChu], [TongTienHang], [TongSoLuong], [PheDuyet], [NhanVienLapID] FROM [gPhieuTraHang] WHERE [PheDuyet] IS NOT NULL" ></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE [DaXoa] = 0"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien] WHERE [DaXoa] = 0 AND [NhomID] <> 5"></asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="function(s, e) {
	        UpdateControlHeight(gridTraHang);
        }" ControlsInitialized="function(s, e) {
	        UpdateControlHeight(gridTraHang);
        }" />
    </dx:ASPxGlobalEvents>
    <dx:ASPxPopupControl ID="popupViewReport" ClientInstanceName="popupViewReport" runat="server" HeaderText="Phiếu xuất hàng" Width="800px" PopupHorizontalAlign="WindowCenter" >
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
</asp:Content>

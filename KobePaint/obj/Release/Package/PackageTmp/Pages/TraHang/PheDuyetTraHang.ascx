<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PheDuyetTraHang.ascx.cs" Inherits="KobePaint.Pages.TraHang.PheDuyetTraHang" %>
<%@ Register assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<script>
    function onEndCallBackReturn(s, e) {
        if (s.cpDuyet) {
            popupViewReportReturn.Show();
            hdfViewReportReturn.Set('view', '1');
            reportViewerReturn.GetViewer().Refresh();
            delete (s.cpDuyet);
        }
    }
</script>
<dx:ASPxGridView ID="gridTraHang" ClientInstanceName="gridTraHang" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="dsTraHang" KeyFieldName="IDPhieuTraHang" OnCustomColumnDisplayText="gridTraHang_CustomColumnDisplayText" OnRowUpdated="gridTraHang_RowUpdated" OnBatchUpdate="gridTraHang_BatchUpdate">
        <ClientSideEvents endcallback="onEndCallBackReturn" />    
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="500" ShowFilterRow="false"/>
        <SettingsDetail ShowDetailRow="True" />
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
            <dx:GridViewDataComboBoxColumn FieldName="KhachHangID" VisibleIndex="2" Caption="Khách hàng" ReadOnly="true">
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
            <dx:GridViewDataCheckColumn FieldName="PheDuyet" VisibleIndex="9" Caption="Phê duyệt">
                <PropertiesCheckEdit AllowGrayed="True">
                </PropertiesCheckEdit>
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataComboBoxColumn Caption="Nhân viên" FieldName="NhanVienLapID" VisibleIndex="8">
                <PropertiesComboBox DataSourceID="dsNhanVien" TextField="HoTen" ValueField="IDNhanVien">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsTraHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDPhieuTraHang], [STTPhieuTraHang], [KhachHangID], [NgayTra], [NgayLuuKho], [GhiChu], [TongTienHang], [TongSoLuong], [PheDuyet], [NhanVienLapID] FROM [gPhieuTraHang] WHERE [PheDuyet] IS NULL" 
        UpdateCommand="UPDATE gPhieuTraHang SET NgayLuuKho = @NgayLuuKho, GhiChu = @GhiChu, PheDuyet = @PheDuyet, NhanVienLapID = @NhanVienLapID WHERE IDPhieuTraHang = @IDPhieuTraHang">
        <UpdateParameters>
            <asp:Parameter Name="NgayLuuKho" />
            <asp:Parameter Name="GhiChu" />
            <asp:Parameter Name="PheDuyet" />
            <asp:Parameter Name="NhanVienLapID" />
            <asp:Parameter Name="IDPhieuTraHang" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE [DaXoa] = 0"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien] WHERE [DaXoa] = 0 AND [NhomID] <> 5"></asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="function(s, e) {
	        UpdateHeightControlInPage(gridTraHang, 60);
        }" ControlsInitialized="function(s, e) {
	        UpdateHeightControlInPage(gridTraHang, 60);
        }" />
    </dx:ASPxGlobalEvents>
    <dx:ASPxPopupControl ID="popupViewReportReturn" ClientInstanceName="popupViewReportReturn" runat="server" HeaderText="Phiếu xuất hàng" Width="800px" Height="600px" ScrollBars="Auto" PopupHorizontalAlign="WindowCenter" >
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxCallbackPanel ID="cbpViewReportReturn" ClientInstanceName="cbpViewReportReturn" runat="server" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent>
                        <dx:ASPxDocumentViewer ID="reportViewerReturn" ClientInstanceName="reportViewerReturn" runat="server">
                        </dx:ASPxDocumentViewer>
                        <dx:ASPxHiddenField ID="hdfViewReportReturn" ClientInstanceName="hdfViewReportReturn" runat="server">
                        </dx:ASPxHiddenField>
                        </dx:PanelContent>
                        </PanelCollection>
                    <ClientSideEvents EndCallback="onEndCallBackViewRpReturn" />
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
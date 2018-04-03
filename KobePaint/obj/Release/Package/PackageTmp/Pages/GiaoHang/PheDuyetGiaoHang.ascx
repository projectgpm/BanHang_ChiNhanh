<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PheDuyetGiaoHang.ascx.cs" Inherits="KobePaint.Pages.GiaoHang.PheDuyetGiaoHang" %>

<%@ Register assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<script>
    function onEndCallBack(s, e)
    {        
        if (s.cpDuyet) {
            popupViewReport.Show();
            cbpViewReport.PerformCallback();
            delete (s.cpDuyet);
        }
    }

    function onEndCallBackViewRp(s, e)
    {
        hdfViewReport.Set('view', '1');
        reportViewer.GetViewer().Refresh();
    }
</script>
<dx:ASPxGridView ID="gridDonHang" ClientInstanceName="gridDonHang" runat="server" AutoGenerateColumns="False" DataSourceID="dsDonHang" KeyFieldName="IDPhieuGiaoHang" Width="100%" OnCustomColumnDisplayText="gridDonHang_CustomColumnDisplayText" OnRowUpdated="gridDonHang_RowUpdated" OnBatchUpdate="gridDonHang_BatchUpdate">
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="500" ShowFilterRow="false"/>
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
        <ClientSideEvents endcallback="onEndCallBack" />
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
                            <PropertiesTextEdit DisplayFormatString="p">
                            </PropertiesTextEdit>
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
        <SettingsText EmptyDataRow="Không có dữ liệu !!" HeaderFilterCancelButton="Hủy" HeaderFilterFrom="Từ" HeaderFilterOkButton="Lọc" HeaderFilterTo="Đến" SearchPanelEditorNullText="Nhập thông tin cần tìm..." CommandBatchEditCancel="Hủy bỏ" CommandBatchEditUpdate="Lưu" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="IDPhieuGiaoHang" ReadOnly="True" VisibleIndex="0" Width="40px">
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Số đơn hàng" FieldName="SoDonHang" VisibleIndex="3">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày đặt hàng" FieldName="NgayDatHang" VisibleIndex="4">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    

<CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy">
                        

<FastNavProperties Enabled="False" />
                    

</CalendarProperties>
                

</PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Ngày xuất hàng" FieldName="NgayXuatHang" VisibleIndex="5">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                    

<CalendarProperties FirstDayOfWeek="Monday" ShowClearButton="False" ShowTodayButton="False" ShowWeekNumbers="False" ClearButtonText="Hủy">
                        

<FastNavProperties Enabled="False" />
                    

</CalendarProperties>
                

</PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Ghi chú" FieldName="GhiChu" VisibleIndex="8">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Phê duyệt" FieldName="PheDuyet" VisibleIndex="12">
                <PropertiesCheckEdit AllowGrayed="True">
                </PropertiesCheckEdit>
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataComboBoxColumn Caption="NV Đặt hàng" FieldName="NhanVienLapID" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="dsNhanVien" TextField="HoTen" ValueField="IDNhanVien">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Khách hàng" FieldName="KhachHangID" VisibleIndex="2" ReadOnly="True" Width="150px">
                <PropertiesComboBox DataSourceID="dsKhachHang" TextField="HoTen" ValueField="IDKhachHang">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Xe" FieldName="XeID" VisibleIndex="6">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
                <PropertiesComboBox DataSourceID="dsXe" TextField="BienSo" ValueField="IDXe">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tài xế" FieldName="TaiXeID" VisibleIndex="7">
                <PropertiesComboBox DataSourceID="dsTaiXe" TextField="HoTen" ValueField="IDNhanVien">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataSpinEditColumn Caption="Tổng tiền" FieldName="TongTienHang" VisibleIndex="9" ReadOnly="True">
                <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatString="N0" NumberFormat="Custom">
                </PropertiesSpinEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataSpinEditColumn Caption="Số lượng hàng" FieldName="TongSoLuong" VisibleIndex="11">
                <PropertiesSpinEdit DisplayFormatString="g" NumberType="Integer">
                </PropertiesSpinEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataSpinEditColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
        SelectCommand="SELECT [IDPhieuGiaoHang], [KhachHangID], [STTDonHang], [SoDonHang], [NgayDatHang], [NgayXuatHang], [XeID], [TaiXeID], [GhiChu], [TongTienHang], [TongSoLuong], [PheDuyet], [NhanVienLapID] FROM [gPhieuGiaoHang] WHERE [PheDuyet] IS NULL" 
        UpdateCommand="UPDATE gPhieuGiaoHang SET NgayDatHang = @NgayDatHang, NgayXuatHang = @NgayXuatHang, XeID = @XeID, TaiXeID = @TaiXeID, PheDuyet = @PheDuyet,  NgayDuyet = getdate() WHERE (IDPhieuGiaoHang = @IDPhieuGiaoHang)">
        <UpdateParameters>
            <asp:Parameter Name="NgayDatHang" Type="DateTime" />
            <asp:Parameter Name="NgayXuatHang" Type="DateTime" />
            <asp:Parameter Name="XeID" Type="Int32" />
            <asp:Parameter Name="TaiXeID" Type="Int32" />
            <asp:Parameter Name="PheDuyet" Type="Boolean" />
            <asp:Parameter Name="IDPhieuGiaoHang" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="function(s, e) {
	        UpdateHeightControlInPage(gridDonHang, 60);
        }" ControlsInitialized="function(s, e) {
	        UpdateHeightControlInPage(gridDonHang, 60);
        }" />
    </dx:ASPxGlobalEvents>
    <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien] WHERE [DaXoa] = 0 AND [NhomID] <> 5"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsTaiXe" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien] WHERE [DaXoa] = 0 AND [NhomID] = 5"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsXe" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDXe], [BienSo] FROM [nvXe]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE [DaXoa] = 0"></asp:SqlDataSource>

    <dx:ASPxPopupControl ID="popupViewReport" ClientInstanceName="popupViewReport" runat="server" HeaderText="Phiếu xuất hàng" Width="800px" Height="600px" ScrollBars="Auto" PopupHorizontalAlign="WindowCenter" >
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxCallbackPanel ID="cbpViewReport" ClientInstanceName="cbpViewReport" runat="server" Width="100%" OnCallback="cbpViewReport_Callback">
                    <PanelCollection>
                        <dx:PanelContent>
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


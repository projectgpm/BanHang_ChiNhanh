<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="DanhSachTraHang.aspx.cs" Inherits="KobePaint.Pages.TraHang.DanhSachTraHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="gridTraHang" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridTraHang" Width="100%" DataSourceID="dsTraHang" KeyFieldName="IDPhieuTraHang" OnCustomColumnDisplayText="gridTraHang_CustomColumnDisplayText">
        <SettingsEditing EditFormColumnCount="3">
        </SettingsEditing>
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="0" ShowFilterRow="True" ShowTitlePanel="True"/>
        <SettingsDetail ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <div style="padding-top:0px; padding-bottom: 14px;">
                    <dx:ASPxLabel ID="lblChiTietHang" runat="server" Text="Chi tiết trả hàng" Font-Bold="True" ForeColor="#009933" Font-Italic="True" Font-Size="16px" Font-Underline="True">
                </dx:ASPxLabel>
                </div>
                <dx:ASPxGridView ID="gridChiTiet" runat="server" AutoGenerateColumns="False" DataSourceID="dsTraHangChiTiet" KeyFieldName="ID" OnBeforePerformDataSelect="gridChiTiet_BeforePerformDataSelect" Width="100%" OnCustomColumnDisplayText="gridChiTiet_CustomColumnDisplayText">
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <SettingsCommandButton>
                        <ShowAdaptiveDetailButton ButtonType="Image">
                        </ShowAdaptiveDetailButton>
                        <HideAdaptiveDetailButton ButtonType="Image">
                        </HideAdaptiveDetailButton>
                    </SettingsCommandButton>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Caption="STT" Width="50px" ShowInCustomizationForm="True">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TenHangHoa" VisibleIndex="2" Caption="Hàng hóa" ShowInCustomizationForm="True">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MaHang" VisibleIndex="1" Caption="Mã HH" Width="80px" ShowInCustomizationForm="True">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataSpinEditColumn Caption="Thành tiền" FieldName="ThanhTien" VisibleIndex="7" Width="80px">
                            <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                            </PropertiesSpinEdit>
                        </dx:GridViewDataSpinEditColumn>
                        <dx:GridViewDataSpinEditColumn Caption="Số lượng" FieldName="SoLuong" VisibleIndex="6" Width="80px">
                            <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                            </PropertiesSpinEdit>
                        </dx:GridViewDataSpinEditColumn>
                        <dx:GridViewDataSpinEditColumn Caption="Giá vốn" FieldName="GiaVon" VisibleIndex="4" Width="80px">
                            <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                            </PropertiesSpinEdit>
                        </dx:GridViewDataSpinEditColumn>
                        <dx:GridViewDataSpinEditColumn Caption="Tồn kho" FieldName="TonKho" VisibleIndex="3" Width="80px">
                            <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                            </PropertiesSpinEdit>
                        </dx:GridViewDataSpinEditColumn>
                        <dx:GridViewDataSpinEditColumn Caption="Tiền trả" FieldName="TienTra" VisibleIndex="5" Width="100px">
                            <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                            </PropertiesSpinEdit>
                        </dx:GridViewDataSpinEditColumn>
                    </Columns>

                    <FormatConditions>
                        <dx:GridViewFormatConditionHighlight FieldName="TonKho" Expression="[TonKho] < 1" Format="LightRedFillWithDarkRedText" />
                            <dx:GridViewFormatConditionHighlight FieldName="TonKho" Expression="[TonKho] > 0" Format="GreenFillWithDarkGreenText" />
                        <dx:GridViewFormatConditionTopBottom FieldName="TonKho" Rule="TopItems" Threshold="15" Format="BoldText"  CellStyle-HorizontalAlign="Center">
    <CellStyle HorizontalAlign="Center"></CellStyle>
                            </dx:GridViewFormatConditionTopBottom>
                    </FormatConditions>
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>                    
                        <Header BackColor="White" Font-Bold="False" HorizontalAlign="Center">
                            <Border BorderStyle="Dashed" />
                        </Header>
                        <Cell>
                            <Border BorderStyle="Dashed" />
                        </Cell>
                    </Styles>
                    <Border BorderColor="Silver" BorderStyle="Solid" />
                    <Border BorderStyle="Solid" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsTraHangChiTiet" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT hhHangHoa.MaHang, hhHangHoa.TenHangHoa, kPhieuTraHangChiTiet.HangHoaID, kPhieuTraHangChiTiet.GiaVon, kPhieuTraHangChiTiet.SoLuong, kPhieuTraHangChiTiet.ThanhTien, kPhieuTraHangChiTiet.TonKho, kPhieuTraHangChiTiet.TienTra, kPhieuTraHangChiTiet.ID FROM hhHangHoa INNER JOIN kPhieuTraHangChiTiet ON hhHangHoa.IDHangHoa = kPhieuTraHangChiTiet.HangHoaID WHERE (kPhieuTraHangChiTiet.PhieuTraHangNCCID = @PhieuTraHangNCCID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="PhieuTraHangNCCID" SessionField="PhieuTraHangNCCID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </DetailRow>
        </Templates>
        <SettingsPager PageSize="30" AlwaysShowPager="True" >
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <SettingsText EmptyDataRow="Không có dữ liệu !!" HeaderFilterCancelButton="Hủy" HeaderFilterFrom="Từ" HeaderFilterOkButton="Lọc" HeaderFilterTo="Đến" SearchPanelEditorNullText="Nhập thông tin cần tìm..." ConfirmDelete="Xác nhận xóa !!" Title="DANH SÁCH ĐẠI LÝ TRẢ HÀNG" />
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <GroupRow ForeColor="#428BCA">
            </GroupRow>
            <Cell>
                <Paddings PaddingBottom="3px" PaddingTop="3px" />
            </Cell>
            <GroupPanel>
                <Paddings Padding="0px" />
            </GroupPanel>
            <FilterCell>
                <Paddings Padding="0px" />
            </FilterCell>
            <SearchPanel>
                <Paddings PaddingBottom="5px" PaddingTop="5px" />
            </SearchPanel>
        </Styles>
        <Paddings Padding="0px" />
        <SettingsBehavior AutoExpandAllGroups="True" ConfirmDelete="True" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image">
            </ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image">
            </HideAdaptiveDetailButton>
            <NewButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_add_16x16">
                </Image>
            </NewButton>
            <UpdateButton ButtonType="Image" RenderMode="Image">
                <Image IconID="save_save_32x32" ToolTip="Lưu">
                </Image>
            </UpdateButton>
            <CancelButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_close_32x32" ToolTip="Hủy">
                </Image>
            </CancelButton>
            <EditButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_edit_16x16devav" ToolTip="Cập nhật số hóa đơn">
                </Image>
            </EditButton>
            <DeleteButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_cancel_16x16" ToolTip="Xóa phiếu nhập hàng">
                </Image>
            </DeleteButton>
        </SettingsCommandButton>
        <EditFormLayoutProperties ColCount="2">
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewDataTextColumn Caption="STT" ReadOnly="True" VisibleIndex="0" FieldName="IDPhieuTraHang" Width="50px">
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mã phiếu" FieldName="MaPhieu" VisibleIndex="1" Width="90px" CellStyle-Font-Bold="true" CellStyle-HorizontalAlign="Center">
                <%--<DataItemTemplate>
                     <a target="_blank" href="<%# Eval("Url") %>" > <%# Eval("MaPhieu") %></a>
                </DataItemTemplate>--%>
<CellStyle HorizontalAlign="Center" Font-Bold="True"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Đại lý" FieldName="DaiLyID" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="dsNhaCC" TextField="HoTen" ValueField="IDKhachHang">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn Caption="Ngày trả" FieldName="NgayTra" VisibleIndex="3" Width="120px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="True">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Người nhập" FieldName="NhanVienID" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="dsNhanVien" TextField="HoTen" ValueField="IDNhanVien">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataSpinEditColumn Caption="SL" FieldName="TongSoLuong" VisibleIndex="5" Width="50px" CellStyle-HorizontalAlign="Center">
                <PropertiesSpinEdit DisplayFormatString="N0">
                </PropertiesSpinEdit>

<CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataSpinEditColumn Caption="Tổng tiền" FieldName="TongTienHang" VisibleIndex="6" CellStyle-Font-Bold="true" Width="100px"> 
                <PropertiesSpinEdit DisplayFormatString="N0" >
                </PropertiesSpinEdit>

<CellStyle Font-Bold="True"></CellStyle>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataSpinEditColumn Caption="Nợ" FieldName="ConLai" VisibleIndex="7" Width="100px">
                <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataMemoColumn Caption="Ghi chú" FieldName="GhiChu" VisibleIndex="8">
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="DuyetDonHang" VisibleIndex="9" Width="150px" CellStyle-HorizontalAlign="Center">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Chưa xử lý" Value="0" />
                        <dx:ListEditItem Text="Đã xử lý" Value="1" />
                        <dx:ListEditItem Text="Đã hủy" Value="2" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>

        <FormatConditions>
            <dx:GridViewFormatConditionHighlight FieldName="DuyetDonHang" Expression="[DuyetDonHang] = 0" Format="YellowFillWithDarkYellowText" />
            <dx:GridViewFormatConditionHighlight FieldName="DuyetDonHang" Expression="[DuyetDonHang] = 1" Format="GreenFillWithDarkGreenText" />
            
            <dx:GridViewFormatConditionHighlight FieldName="CongNo" Expression="[CongNo] > 0" Format="RedText" />

            <dx:GridViewFormatConditionTopBottom FieldName="TonKho" Rule="TopItems" Threshold="15" Format="BoldText"  CellStyle-HorizontalAlign="Center">
                <CellStyle HorizontalAlign="Center"></CellStyle>
                </dx:GridViewFormatConditionTopBottom>
        </FormatConditions>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsTraHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT kPhieuTraHang.* FROM kPhieuTraHang ORDER BY IDPhieuTraHang DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhaCC" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE [LoaiKhachHangID] = 3"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien]"></asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="function(s, e) {
	        UpdateControlHeight(gridTraHang);
        }" ControlsInitialized="function(s, e) {
	        UpdateControlHeight(gridTraHang);
        }" />
    </dx:ASPxGlobalEvents>
</asp:Content>

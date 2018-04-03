<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="HangHoa.aspx.cs" Inherits="KobePaint.Pages.HangHoa.HangHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="gridHangHoa" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridHangHoa" Width="100%" DataSourceID="dsHangHoa" KeyFieldName="IDHangHoa" OnCustomColumnDisplayText="grid_CustomColumnDisplayText">
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="0" ShowFilterRow="True"/>
        <SettingsDetail ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <div style="width: 100%; text-align:center;">
                    <div style="display:inline-block;">
                        <dx:ASPxGridView ID="gridApGia" runat="server" AutoGenerateColumns="False" DataSourceID="dsApGia" KeyFieldName="ID" Width="500px" OnBeforePerformDataSelect="gridApGia_BeforePerformDataSelect" OnRowValidating="gridApGia_RowValidating">
                            <Settings ShowTitlePanel="True" />
                            <SettingsCommandButton>
                                <ShowAdaptiveDetailButton ButtonType="Image">
                                </ShowAdaptiveDetailButton>
                                <HideAdaptiveDetailButton ButtonType="Image">
                                </HideAdaptiveDetailButton>
                                <NewButton ButtonType="Image" RenderMode="Image">
                                    <Image IconID="numberformats_accounting_16x16">
                                    </Image>
                                </NewButton>
                                <EditButton ButtonType="Image" RenderMode="Image">
                                    <Image IconID="tasks_edittask_16x16office2013">
                                    </Image>
                                </EditButton>
                                <DeleteButton ButtonType="Image" RenderMode="Image">
                                    <Image IconID="actions_close_16x16devav">
                                    </Image>
                                </DeleteButton>
                            </SettingsCommandButton>
                            <SettingsText Title="BẢNG ÁP GIÁ" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="3">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataSpinEditColumn Caption="Giá bán" FieldName="GiaBan" VisibleIndex="2">
                                    <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Chưa nhập thông tin" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesSpinEdit>
                                </dx:GridViewDataSpinEditColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Khách hàng" FieldName="LoaiKhachHangID" VisibleIndex="1">
                                    <PropertiesComboBox DataSourceID="dsLoaiKhachHang" ValueField="IDLoaiKhachHang" TextField="TenLoaiKhachHang">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Chưa nhập thông tin" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn FieldName="HangHoaID" Visible="False" VisibleIndex="4">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <TitlePanel ForeColor="#00CC00" Font-Bold="True" Font-Size="14px">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>
                    </div>
                </div>
                <asp:SqlDataSource ID="dsApGia" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
                    SelectCommand="SELECT [ID], [LoaiKhachHangID], [GiaBan], [HangHoaID] FROM [hhApGia] WHERE ([HangHoaID] = @HangHoaID)" 
                    DeleteCommand="DELETE FROM [hhApGia] WHERE [ID] = @ID" 
                    InsertCommand="INSERT INTO [hhApGia] ([LoaiKhachHangID], [GiaBan], [HangHoaID]) VALUES (@LoaiKhachHangID, @GiaBan, @HangHoaID)" 
                    UpdateCommand="UPDATE [hhApGia] SET [LoaiKhachHangID] = @LoaiKhachHangID, [GiaBan] = @GiaBan WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="HangHoaID" SessionField="IDHangHoa" Type="Int32" />
                        <asp:Parameter Name="LoaiKhachHangID" Type="Int32" />
                        <asp:Parameter Name="GiaBan" Type="Double" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="HangHoaID" SessionField="IDHangHoa" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LoaiKhachHangID" Type="Int32" />
                        <asp:Parameter Name="GiaBan" Type="Double" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </DetailRow>
        </Templates>
        <SettingsPager PageSize="30" AlwaysShowPager="True" >
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <SettingsPopup>
            <CustomizationWindow HorizontalAlign="LeftSides" VerticalAlign="TopSides" />
        </SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <SettingsText EmptyDataRow="Không có dữ liệu !!" HeaderFilterCancelButton="Hủy" HeaderFilterFrom="Từ" HeaderFilterOkButton="Lọc" HeaderFilterTo="Đến" SearchPanelEditorNullText="Nhập thông tin cần tìm..." PopupEditFormCaption="Nhập thông tin hàng hóa" />
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <GroupRow ForeColor="#428BCA">
            </GroupRow>
            <DetailRow HorizontalAlign="Center">
            </DetailRow>
            <DetailCell HorizontalAlign="Center">
            </DetailCell>
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
        <Border BorderWidth="0px" />
        <BorderBottom BorderWidth="1px" />
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
                <Image IconID="save_save_32x32">
                </Image>
            </UpdateButton>
            <CancelButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_close_32x32">
                </Image>
            </CancelButton>
            <EditButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_edit_16x16devav">
                </Image>
            </EditButton>
            <DeleteButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_cancel_16x16">
                </Image>
            </DeleteButton>
        </SettingsCommandButton>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="9">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="IDHangHoa" ReadOnly="True" VisibleIndex="0" Width="50px">
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tên hàng hóa" FieldName="TenHangHoa" VisibleIndex="1" Width="200px">
                <PropertiesTextEdit>
                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField ErrorText="Nhập tên hàng hóa" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mã số" FieldName="MaSo" VisibleIndex="2">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="KyHieu" VisibleIndex="3">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Đơn vị tính" FieldName="QuiCach" VisibleIndex="4">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Nhóm" FieldName="NhomHHID" VisibleIndex="6" Width="250px">
                <PropertiesComboBox DataSourceID="dsNhomHH" TextField="TenNhom" ValueField="IDNhomHH">
                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField ErrorText="Chọn nhóm hàng" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Loại" FieldName="LoaiHHID" VisibleIndex="7">
                <PropertiesComboBox DataSourceID="dsLoaiHH" TextField="TenLoai" ValueField="IDLoaiHH">
                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField ErrorText="Chọn loại hàng hóa" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataSpinEditColumn Caption="Trọng lượng" FieldName="TrongLuong" VisibleIndex="5">
                <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatString="g">
                </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataSpinEditColumn Caption="Giá bán" FieldName="GiaBan" VisibleIndex="8">
                <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatString="N0">
                </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsHangHoa" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
        DeleteCommand="UPDATE [hhHangHoa] SET [DaXoa] = 1 WHERE [IDHangHoa] = @IDHangHoa" 
        InsertCommand="INSERT INTO [hhHangHoa] ([TenHangHoa], [MaSo], [KyHieu], [QuiCach], [TrongLuong], [NhomHHID], [LoaiHHID], [GiaBan]) VALUES (@TenHangHoa, @MaSo, @KyHieu, @QuiCach, @TrongLuong, @NhomHHID, @LoaiHHID, @GiaBan)" 
        SelectCommand="SELECT [IDHangHoa], [TenHangHoa], [MaSo], [KyHieu], [QuiCach], [TrongLuong], [NhomHHID], [LoaiHHID], [GiaBan] FROM [hhHangHoa]" 
        UpdateCommand="UPDATE [hhHangHoa] SET [TenHangHoa] = @TenHangHoa, [MaSo] = @MaSo, [KyHieu] = @KyHieu, [QuiCach] = @QuiCach, [TrongLuong] = @TrongLuong, [NhomHHID] = @NhomHHID, [LoaiHHID] = @LoaiHHID, [GiaBan] = @GiaBan WHERE [IDHangHoa] = @IDHangHoa">
        <DeleteParameters>
            <asp:Parameter Name="IDHangHoa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenHangHoa" Type="String" />
            <asp:Parameter Name="MaSo" Type="String" />
            <asp:Parameter Name="KyHieu" Type="String" />
            <asp:Parameter Name="QuiCach" Type="String" />
            <asp:Parameter Name="TrongLuong" Type="Double" />
            <asp:Parameter Name="NhomHHID" Type="Int32" />
            <asp:Parameter Name="LoaiHHID" Type="Int32" />
            <asp:Parameter Name="GiaBan" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenHangHoa" Type="String" />
            <asp:Parameter Name="MaSo" Type="String" />
            <asp:Parameter Name="KyHieu" Type="String" />
            <asp:Parameter Name="QuiCach" Type="String" />
            <asp:Parameter Name="TrongLuong" Type="Double" />
            <asp:Parameter Name="NhomHHID" Type="Int32" />
            <asp:Parameter Name="LoaiHHID" Type="Int32" />
            <asp:Parameter Name="IDHangHoa" Type="Int32" />
            <asp:Parameter Name="GiaBan" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="function(s, e) {
	        UpdateControlHeight(gridHangHoa);
        }" ControlsInitialized="function(s, e) {
	        UpdateControlHeight(gridHangHoa);
        }" />
    </dx:ASPxGlobalEvents>
    <asp:SqlDataSource ID="dsNhomHH" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhomHH], [TenNhom] FROM [hhNhomHang] WHERE [DaXoa] = 0"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsLoaiHH" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDLoaiHH], [TenLoai] FROM [hhLoaiHang] WHERE [DaXoa] = 0"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsLoaiKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDLoaiKhachHang], [TenLoaiKhachHang] FROM [khLoaiKhachHang]"></asp:SqlDataSource>
</asp:Content>

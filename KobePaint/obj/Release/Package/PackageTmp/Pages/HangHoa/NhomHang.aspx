<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="NhomHang.aspx.cs" Inherits="KobePaint.Pages.HangHoa.NhomHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="gridNhomHang" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridNhomHang" Width="100%" DataSourceID="dsNhomHang" KeyFieldName="IDNhomHH" OnCustomColumnDisplayText="gridNhomHang_CustomColumnDisplayText">
        <SettingsEditing Mode="Inline">
        </SettingsEditing>
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="0" ShowFilterRow="True"/>
        <SettingsPager PageSize="30" AlwaysShowPager="True" >
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <SettingsText EmptyDataRow="Không có dữ liệu !!" HeaderFilterCancelButton="Hủy" HeaderFilterFrom="Từ" HeaderFilterOkButton="Lọc" HeaderFilterTo="Đến" SearchPanelEditorNullText="Nhập thông tin cần tìm..." />
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
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="2" Width="120px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="IDNhomHH" ReadOnly="True" VisibleIndex="0" Caption="STT" Width="60px">
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TenNhom" VisibleIndex="1" Caption="Tên nhóm">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsNhomHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" DeleteCommand="UPDATE [hhNhomHang] SET [DaXoa] = 1 WHERE [IDNhomHH] = @IDNhomHH" InsertCommand="INSERT INTO [hhNhomHang] ([TenNhom]) VALUES (@TenNhom)" SelectCommand="SELECT [IDNhomHH], [TenNhom] FROM [hhNhomHang] Where [DaXoa] = 0" UpdateCommand="UPDATE [hhNhomHang] SET [TenNhom] = @TenNhom WHERE [IDNhomHH] = @IDNhomHH">
        <DeleteParameters>
            <asp:Parameter Name="IDNhomHH" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenNhom" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenNhom" Type="String" />
            <asp:Parameter Name="IDNhomHH" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="function(s, e) {
	        UpdateControlHeight(gridNhomHang);
        }" ControlsInitialized="function(s, e) {
	        UpdateControlHeight(gridNhomHang);
        }" />
    </dx:ASPxGlobalEvents>
</asp:Content>

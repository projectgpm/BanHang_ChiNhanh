<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="MaSoMau.aspx.cs" Inherits="KobePaint.Pages.HangHoa.MaSoMau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="gridMaSoMau" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridMaSoMau" Width="100%" DataSourceID="dsMaSoMau" KeyFieldName="IDMaMau" OnCustomColumnDisplayText="gridMaSoMau_CustomColumnDisplayText">
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
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="3" Width="120px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="IDMaMau" ReadOnly="True" VisibleIndex="0" Width="60px">
                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mã số màu" FieldName="MaSoMau" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Trạng thái" FieldName="TrangThai" VisibleIndex="2" Width="120px">
                <PropertiesCheckEdit DisplayTextChecked="Ẩn" DisplayTextUnchecked="Hiển thị">
                    <DisplayImageChecked IconID="actions_hide_16x16office2013">
                    </DisplayImageChecked>
                    <DisplayImageUnchecked IconID="actions_show_16x16">
                    </DisplayImageUnchecked>
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsMaSoMau" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" DeleteCommand="DELETE FROM [hhMaSoMau] WHERE [IDMaMau] = @IDMaMau" InsertCommand="INSERT INTO [hhMaSoMau] ([MaSoMau], [TrangThai]) VALUES (@MaSoMau, @TrangThai)" SelectCommand="SELECT [IDMaMau], [MaSoMau], [TrangThai] FROM [hhMaSoMau]" UpdateCommand="UPDATE [hhMaSoMau] SET [MaSoMau] = @MaSoMau, [TrangThai] = @TrangThai WHERE [IDMaMau] = @IDMaMau">
        <DeleteParameters>
            <asp:Parameter Name="IDMaMau" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaSoMau" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaSoMau" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="IDMaMau" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="function(s, e) {
	        UpdateControlHeight(gridMaSoMau);
        }" ControlsInitialized="function(s, e) {
	        UpdateControlHeight(gridMaSoMau);
        }" />
    </dx:ASPxGlobalEvents>
</asp:Content>

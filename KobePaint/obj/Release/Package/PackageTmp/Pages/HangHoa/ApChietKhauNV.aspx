<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ApChietKhauNV.aspx.cs" Inherits="KobePaint.Pages.HangHoa.ApChietKhauNV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <dx:ASPxFormLayout ID="formApChieuKhau" ClientInstanceName="formApChieuKhau" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Danh sách áp chiết khấu cho nhân viên" GroupBoxDecoration="HeadingLine" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nhân viên">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ccbNhanVien" runat="server" DataSourceID="dsNhanVien" DisplayFormatString="{0}" ValueField="IDNhanVien" SelectedIndex="0">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Họ tên" FieldName="HoTen" />
                                        <dx:ListBoxColumn Caption="Điện thoại" FieldName="DienThoai" />
                                    </Columns>
                                    <ClientSideEvents SelectedIndexChanged="function(s, e){ gridDanhSach.Refresh(); }" />
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen], [DienThoai] FROM [nvNhanVien]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItems HorizontalAlign="Center" />
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxGridView ID="gridDanhSach" ClientInstanceName="gridDanhSach" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="dsApChietKhau" KeyFieldName="IDHangHoa;IDNhanVien" OnRowUpdating="gridDanhSach_RowUpdating">
        <Settings ShowFilterRow="True" VerticalScrollBarMode="Auto" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image">
            </ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image">
            </HideAdaptiveDetailButton>
            <EditButton ButtonType="Image" RenderMode="Image">
                <Image IconID="numberformats_accounting_16x16" ToolTip="Cập nhật CK">
                </Image>
            </EditButton>
            <DeleteButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_cancel_16x16" ToolTip="Bỏ CK">
                </Image>
            </DeleteButton>
            <UpdateButton RenderMode="Image">
                <Image IconID="save_save_32x32" ToolTip="Lưu tất cả thay đổi">
                </Image>
            </UpdateButton>
            <CancelButton RenderMode="Image">
                <Image IconID="actions_close_32x32">
                </Image>
            </CancelButton>
        </SettingsCommandButton>
        <SettingsPager PageSize="20">
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <SettingsText EmptyDataRow="Không có dữ liệu" />
        <Columns>
            <dx:GridViewCommandColumn Caption=" " ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="8" Width="60px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="IDNhanVien" Visible="False" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tên hàng hóa" FieldName="TenHangHoa" VisibleIndex="2">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="IDHangHoa" VisibleIndex="1">
                <Settings AllowAutoFilter="False" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mã số" FieldName="MaSo" VisibleIndex="3">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ĐVT" FieldName="QuiCach" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Giá bán" FieldName="GiaBan" VisibleIndex="5">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataSpinEditColumn Caption="Chiết khấu" FieldName="TyLe" VisibleIndex="6">
                <PropertiesSpinEdit DisplayFormatString="p" NumberFormat="Custom" DecimalPlaces="2">
                </PropertiesSpinEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataSpinEditColumn>
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsApChietKhau" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
        SelectCommand="SELECT [IDNhanVien], [TenHangHoa], [HoTen], [IDHangHoa], [TyLe], [MaSo], [QuiCach], [ID], [GiaBan] FROM [hViewApChieuKhauNV] WHERE ([IDNhanVien] = @IDNhanVien) ORDER BY [IDHangHoa]" 
        DeleteCommand="DELETE FROM hhApChietKhauNV WHERE (NhanVienID = @IDNhanVien) AND (HangHoaID = @IDHangHoa)" 
        >
        <SelectParameters>
            <asp:ControlParameter ControlID="formApChieuKhau$ccbNhanVien" Name="IDNhanVien" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="IDNhanVien" />
            <asp:Parameter Name="IDHangHoa" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <script>
        function AdjustSize() {
            var hform = formApChieuKhau.GetHeight();
            UpdateHeightControlInPage(gridDanhSach, hform);
        }
    </script>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
    </dx:ASPxGlobalEvents>
</asp:Content>

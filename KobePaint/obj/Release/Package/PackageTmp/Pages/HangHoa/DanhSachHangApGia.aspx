<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="DanhSachHangApGia.aspx.cs" Inherits="KobePaint.Pages.HangHoa.DanhSachHangApGia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxFormLayout ID="formThongTin" ClientInstanceName="formThongTin" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Danh sách hàng hóa áp giá cho đại lý" ColCount="2" GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Loại khách hàng">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ccbLoaiKH" runat="server" Width="100%" DataSourceID="dsLoaiKhachHang" SelectedIndex="0" TextField="TenLoaiKhachHang" ValueField="IDLoaiKhachHang">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e){ gridDanhSach.Refresh(); }" />
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="dsLoaiKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDLoaiKhachHang], [TenLoaiKhachHang] FROM [khLoaiKhachHang] WHERE IDLoaiKhachHang <> 1 AND DaXoa = 0"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Loại sản phẩm">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ccbLoai" runat="server" Width="100%" DataSourceID="dsLoai" SelectedIndex="0" TextField="TenLoai" ValueField="IDLoaiHH">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e){ gridDanhSach.Refresh(); }" />
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT 0 as IDLoaiHH, N'Tất cả' as TenLoai UNION ALL SELECT [IDLoaiHH], [TenLoai] FROM [hhLoaiHang] WHERE DaXoa = 0"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxGridView ID="gridDanhSach" ClientInstanceName="gridDanhSach" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="dsApGia" KeyFieldName="ID">
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
            <NewButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_add_16x16">
                </Image>
            </NewButton>
            <DeleteButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_cancel_16x16">
                </Image>
            </DeleteButton>
        </SettingsCommandButton>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="8" Width="50px">
                <HeaderTemplate>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" RenderMode="Link" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {
                            ClearformApGia();
	                        popupApGia.Show();
                        }" />
                        <Image IconID="actions_add_16x16">
                        </Image>
                    </dx:ASPxButton>
                </HeaderTemplate>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="ID" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IDHangHoa" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tên hàng hóa" FieldName="TenHangHoa" VisibleIndex="2">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mã số" FieldName="MaSo" VisibleIndex="3">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ĐVT" FieldName="QuiCach" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Trọng lượng" FieldName="TrongLuong" VisibleIndex="5">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Giá bán gốc" FieldName="GiaBan" VisibleIndex="6">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Giá bán chiết khấu" FieldName="GiaCK" VisibleIndex="7">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsApGia" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
        SelectCommand="SELECT hhApGia.ID, hhHangHoa.IDHangHoa, hhHangHoa.TenHangHoa, hhHangHoa.MaSo, hhHangHoa.QuiCach, hhHangHoa.TrongLuong, hhHangHoa.GiaBan, hhApGia.GiaBan AS GiaCK FROM hhApGia INNER JOIN hhHangHoa ON hhApGia.HangHoaID = hhHangHoa.IDHangHoa WHERE (hhApGia.LoaiKhachHangID = @IDLoaiKhachHang) AND (@IDLoaiHH = 0 OR hhHangHoa.LoaiHHID = @IDLoaiHH)"
        InsertCommand="INSERT INTO [hhApGia] ([LoaiKhachHangID],[HangHoaID],[GiaBan]) VALUES (@IDLoaiKH, @IDHangHoa, @GiaBan)"
        UpdateCommand="UPDATE [hhApGia] SET [GiaBan] = @GiaCK WHERE ID = @ID"
        DeleteCommand="DELETE FROM [hhApGia] WHERE ID = @ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="formThongTin$ccbLoaiKH" Name="IDLoaiKhachHang" PropertyName="Value" />
            <asp:ControlParameter ControlID="formThongTin$ccbLoai" Name="IDLoaiHH" PropertyName="Value" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="formThongTin$ccbLoaiKH" Name="IDLoaiKH" PropertyName="Value" />
            <asp:Parameter Name="IDHangHoa" Type="Int32" />
            <asp:Parameter Name="GiaBan" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GiaCK" Type="Double" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <dx:ASPxPopupControl ID="popupApGia" runat="server" ClientInstanceName="popupApGia" HeaderText="Áp giá cho đại lý" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="False" Width="600px" OnWindowCallback="popupApGia_WindowCallback" CloseAction="None">
        <ClientSideEvents EndCallback="function(s, e) {
	        if(s.cpApGia)
            {
		        popupApGia.Hide();
		        gridDanhSach.Refresh();
                delete(s.cpApGia);
            }
        }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxFormLayout ID="formApGia" ClientInstanceName="formApGia" runat="server" ColCount="3">
                    <Items>
                        <dx:LayoutItem Caption="Hàng hóa">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="ccbHangHoa" ClientInstanceName="ccbHangHoa" runat="server" DataSourceID="dsHangHoa" DisplayFormatString="{0}" ValueField="IDHangHoa" OnCallback="ccbHangHoa_Callback">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                        popupApGia.PerformCallback('Gia');
                                        }" />
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Tên hàng hóa" FieldName="TenHangHoa" />
                                            <dx:ListBoxColumn Caption="Mã số" FieldName="MaSo" />
                                            <dx:ListBoxColumn Caption="ĐVT" FieldName="QuiCach" />
                                        </Columns>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="dsHangHoa" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT IDHangHoa, TenHangHoa, MaSo, QuiCach FROM hhHangHoa WHERE (IDHangHoa NOT IN (SELECT HangHoaID FROM hhApGia WHERE (LoaiKhachHangID = @IDLoaiKH)))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="formThongTin$ccbLoaiKH" Name="IDLoaiKH" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Giá bán">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtGiaBan" ClientInstanceName="txtGiaBan" runat="server">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Áp giá">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxSpinEdit ID="spApGia" ClientInstanceName="spApGia" runat="server" DisplayFormatString="N0" Increment="5000">
                                    </dx:ASPxSpinEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ColSpan="3" HorizontalAlign="Right" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="btnLuu" runat="server" AutoPostBack="False" RenderMode="Link">
                                        <ClientSideEvents Click="function(s, e) {
	                                        popupApGia.PerformCallback('ApGia');
                                        }" />
                                        <Image IconID="save_save_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="btnHuy" runat="server" RenderMode="Link" AutoPostBack="False">
                                        <ClientSideEvents Click="function(s, e) {
	                                        popupApGia.Hide();
                                        }" />
                                        <Image IconID="actions_cancel_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="" ClientVisible="False" ColSpan="3" ShowCaption="False" Name="itemError">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblError" runat="server" Font-Bold="True" ForeColor="Red">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                    <SettingsItemCaptions Location="Top" />
                </dx:ASPxFormLayout>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <script>
        function ClearformApGia()
        {
            ccbHangHoa.PerformCallback();
            ccbHangHoa.SetSelectedIndex(-1);
            txtGiaBan.SetText('');
            spApGia.SetValue(null);
            formApGia.GetItemByName('itemError').SetVisible(false);
        }
    </script>
    <script>
        function AdjustSize() {
            var hform = formThongTin.GetHeight();
            UpdateHeightControlInPage(gridDanhSach, hform);
        }
    </script>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
    </dx:ASPxGlobalEvents>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="DanhSachKH.aspx.cs" Inherits="KobePaint.Pages.KH_NCC.DanhSachKH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function ShowPopup(elementID, paras) {
            cbpInfoStep.PerformCallback(paras);
            popupInfoStep.ShowAtElementByID(elementID);
        }
        function HidePopup() {
            popupInfoStep.Hide();
        }
    </script>
    <dx:ASPxGridView ID="gridDanhSachKH" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridDanhSachKH" DataSourceID="dsKhachHang" KeyFieldName="IDKhachHang" Width="100%" OnHtmlDataCellPrepared="gridDanhSachKH_HtmlDataCellPrepared">
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="0" ShowFilterRow="True"/>
        <SettingsPager PageSize="30" AlwaysShowPager="True" >
            <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <SettingsText EmptyDataRow="Không có dữ liệu !!" HeaderFilterCancelButton="Hủy" HeaderFilterFrom="Từ" HeaderFilterOkButton="Lọc" HeaderFilterTo="Đến" SearchPanelEditorNullText="Nhập thông tin khách hàng cần tìm..." />
        <FormatConditions>
            <dx:GridViewFormatConditionHighlight Expression="[TienTTConLai] &gt;= [HanMucCongNo] And [HanMucCongNo] &lt;&gt; 0" FieldName="TienTTConLai" Format="Custom">
                <CellStyle BackColor="LightPink" ForeColor="DarkRed">
                </CellStyle>
            </dx:GridViewFormatConditionHighlight>
        </FormatConditions>
        <Styles>
            <Header HorizontalAlign="Center">
                <Paddings Padding="3px" />
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
            <UpdateButton ButtonType="Image" RenderMode="Image">
                <Image IconID="save_save_32x32">
                </Image>
            </UpdateButton>
            <CancelButton ButtonType="Image" RenderMode="Image">
                <Image IconID="actions_close_32x32">
                </Image>
            </CancelButton>
            <EditButton ButtonType="Image" RenderMode="Image">
                <Image IconID="mail_editcontact_32x32">
                </Image>
            </EditButton>
        </SettingsCommandButton>
        <Columns>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="IDKhachHang" ReadOnly="True" VisibleIndex="0" Width="40px">
                <EditFormSettings Visible="False" />
                <Settings AllowAutoFilter="False" AllowFilterBySearchPanel="False" />
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mã KH" FieldName="MaKhachHang" VisibleIndex="1" Width="120px">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Họ tên" FieldName="HoTen" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DiaChi" Visible="False" VisibleIndex="4" Caption="Địa chỉ">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Điện thoại" FieldName="DienThoai" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaSoThue" Visible="False" VisibleIndex="6" Caption="Mã số thuế">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GhiChu" Visible="False" VisibleIndex="7" Caption="Ghi chú">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DaThanhToan" VisibleIndex="9" Caption="Đã thanh toán">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TienTamUng" Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TienTTConLai" VisibleIndex="11" Caption="Còn nợ">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataSpinEditColumn Caption="Tổng công nợ" FieldName="TongCongNo" VisibleIndex="8">
                <PropertiesSpinEdit DisplayFormatString="g" Increment="1000">
                </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataSpinEditColumn Caption="Hạn mức" FieldName="HanMucCongNo" VisibleIndex="12" Visible="False">
                <PropertiesSpinEdit DisplayFormatString="g" Increment="1000">
                </PropertiesSpinEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataSpinEditColumn Caption="Thời hạn TT" FieldName="ThoiHanThanhToan" VisibleIndex="13">
                <PropertiesSpinEdit DisplayFormatString="g">
                </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewCommandColumn Caption=" " ShowEditButton="True" VisibleIndex="15" Width="60px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn FieldName="LoaiKhachHangID" Visible="False" VisibleIndex="3" Caption="Loại KH">
                <PropertiesComboBox DataSourceID="dsLoaiKH" TextField="TenLoaiKhachHang" ValueField="IDLoaiKhachHang">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="NhanVienPhuTrachID" VisibleIndex="14" Caption="NV phụ trách">
                <PropertiesComboBox DataSourceID="dsNhanVien" TextField="HoTen" ValueField="IDNhanVien">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [MaKhachHang], [LoaiKhachHangID], [HoTen], [DiaChi], [DienThoai], [MaSoThue], [GhiChu], [NhanVienPhuTrachID], [TongCongNo], [DaThanhToan], [TienTamUng], [TienTTConLai], [HanMucCongNo], [ThoiHanThanhToan], [DaXoa] FROM [khKhachHang]" DeleteCommand="DELETE FROM [khKhachHang] WHERE [IDKhachHang] = @IDKhachHang" InsertCommand="INSERT INTO [khKhachHang] ([MaKhachHang], [LoaiKhachHangID], [HoTen], [DiaChi], [DienThoai], [MaSoThue], [GhiChu], [NhanVienPhuTrachID], [TongCongNo], [DaThanhToan], [TienTamUng], [TienTTConLai], [HanMucCongNo], [ThoiHanThanhToan], [DaXoa]) VALUES (@MaKhachHang, @LoaiKhachHangID, @HoTen, @DiaChi, @DienThoai, @MaSoThue, @GhiChu, @NhanVienPhuTrachID, @TongCongNo, @DaThanhToan, @TienTamUng, @TienTTConLai, @HanMucCongNo, @ThoiHanThanhToan, @DaXoa)" UpdateCommand="UPDATE [khKhachHang] SET [MaKhachHang] = @MaKhachHang, [LoaiKhachHangID] = @LoaiKhachHangID, [HoTen] = @HoTen, [DiaChi] = @DiaChi, [DienThoai] = @DienThoai, [MaSoThue] = @MaSoThue, [GhiChu] = @GhiChu, [NhanVienPhuTrachID] = @NhanVienPhuTrachID, [TongCongNo] = @TongCongNo, [DaThanhToan] = @DaThanhToan, [TienTamUng] = @TienTamUng, [TienTTConLai] = @TienTTConLai, [HanMucCongNo] = @HanMucCongNo, [ThoiHanThanhToan] = @ThoiHanThanhToan, [DaXoa] = @DaXoa WHERE [IDKhachHang] = @IDKhachHang">
        <DeleteParameters>
            <asp:Parameter Name="IDKhachHang" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaKhachHang" Type="String" />
            <asp:Parameter Name="LoaiKhachHangID" Type="Int32" />
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="MaSoThue" Type="String" />
            <asp:Parameter Name="GhiChu" Type="String" />
            <asp:Parameter Name="NhanVienPhuTrachID" Type="Int32" />
            <asp:Parameter Name="TongCongNo" Type="Double" />
            <asp:Parameter Name="DaThanhToan" Type="Double" />
            <asp:Parameter Name="TienTamUng" Type="Double" />
            <asp:Parameter Name="TienTTConLai" Type="Double" />
            <asp:Parameter Name="HanMucCongNo" Type="Double" />
            <asp:Parameter Name="ThoiHanThanhToan" Type="Int32" />
            <asp:Parameter Name="DaXoa" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaKhachHang" Type="String" />
            <asp:Parameter Name="LoaiKhachHangID" Type="Int32" />
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="MaSoThue" Type="String" />
            <asp:Parameter Name="GhiChu" Type="String" />
            <asp:Parameter Name="NhanVienPhuTrachID" Type="Int32" />
            <asp:Parameter Name="TongCongNo" Type="Double" />
            <asp:Parameter Name="DaThanhToan" Type="Double" />
            <asp:Parameter Name="TienTamUng" Type="Double" />
            <asp:Parameter Name="TienTTConLai" Type="Double" />
            <asp:Parameter Name="HanMucCongNo" Type="Double" />
            <asp:Parameter Name="ThoiHanThanhToan" Type="Int32" />
            <asp:Parameter Name="DaXoa" Type="Boolean" />
            <asp:Parameter Name="IDKhachHang" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsLoaiKH" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDLoaiKhachHang], [TenLoaiKhachHang] FROM [khLoaiKhachHang] WHERE [DaXoa] = 0"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien]"></asp:SqlDataSource>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="function(s, e) {
	        UpdateControlHeight(gridDanhSachKH);
        }" ControlsInitialized="function(s, e) {
	        UpdateControlHeight(gridDanhSachKH);
        }" />
    </dx:ASPxGlobalEvents>
    <dx:ASPxPopupControl ID="popupInfoStep" runat="server" ClientInstanceName="popupInfoStep" CloseAction="MouseOut" ShowHeader="False" Width="300px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div id="contentPopup">
                    <dx:ASPxCallbackPanel ID="cbpInfoStep" ClientInstanceName="cbpInfoStep" runat="server" OnCallback="cbpInfoStep_Callback" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <asp:Literal ID="litNoiDung" runat="server"></asp:Literal>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

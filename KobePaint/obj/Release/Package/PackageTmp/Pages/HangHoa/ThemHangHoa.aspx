<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ThemHangHoa.aspx.cs" Inherits="KobePaint.Pages.HangHoa.ThemHangHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function gridEndCallBack(s, e) {
            if (s.cpIsDelete == true)
            {
                s.AddNewRow();
                delete (s.cpIsDelete);
            }
        }
        function onSaveClick()
        {
            if (ASPxClientEdit.ValidateGroup('checkInput'))
                cbpThemHH.PerformCallback('Save');
        }
        function onRenewClick()
        {
            cbpThemHH.PerformCallback('Renew');
        }
    </script>
    <dx:ASPxCallbackPanel ID="cbpThemHH" ClientInstanceName="cbpThemHH" runat="server" Width="100%" OnCallback="cbpThemHH_Callback">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="formThemHH" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Thêm hàng hóa" GroupBoxDecoration="HeadingLine" HorizontalAlign="Center" ColCount="2">
                            <Items>
                                <dx:LayoutItem Caption="Tên hàng hóa" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtTenHH" runat="server" Width="100%">
                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="checkInput">
                                                    <RequiredField ErrorText="Vui lòng nhập tên hàng hóa" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Mã hàng hóa">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtMaHH" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Ký hiệu">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtKyHieu" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Loại hàng hóa">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ccbLoaiHH" runat="server" Width="100%" DataSourceID="dsLoaiHH" TextField="TenLoai" ValueField="IDLoaiHH" NullText="--chọn loại hàng--">
                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="checkInput">
                                                    <RequiredField ErrorText="Chưa nhập thông tin" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="dsLoaiHH" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDLoaiHH], [TenLoai] FROM [hhLoaiHang]"></asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Nhóm hàng hóa">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ccbNhomHH" runat="server" Width="100%" DataSourceID="dsNhomHH" TextField="TenNhom" ValueField="IDNhomHH" NullText="--chọn nhóm hàng--">
                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="checkInput">
                                                    <RequiredField ErrorText="Chưa nhập thông tin" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="dsNhomHH" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhomHH], [TenNhom] FROM [hhNhomHang]"></asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Qui cách (ĐVT)">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtDVT" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Trọng lượng">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit ID="spTrongLuong" runat="server" Width="100%">
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Đơn giá" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit ID="spGiaBan" runat="server" Increment="5000" Number="0" Width="100%" DisplayFormatString="N0">
                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="checkInput">
                                                    <RequiredField ErrorText="Chưa nhập thông tin" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Áp giá" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="gridApGia" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridApGia" DataSourceID="dsLoaiKH" KeyFieldName="IDLoaiKhachHang" Width="100%">
                                                <SettingsPager Mode="ShowAllRecords">
                                                </SettingsPager>
                                                <SettingsCommandButton>
                                                    <ShowAdaptiveDetailButton ButtonType="Image">
                                                    </ShowAdaptiveDetailButton>
                                                    <HideAdaptiveDetailButton ButtonType="Image">
                                                    </HideAdaptiveDetailButton>                                                    
                                                </SettingsCommandButton>
                                                <SettingsText CommandBatchEditCancel="Hủy" CommandBatchEditUpdate="Lưu" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="IDLoaiKhachHang" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Khách hàng" FieldName="TenLoaiKhachHang" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataSpinEditColumn Caption="Giá bán" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <PropertiesSpinEdit DisplayFormatString="N0">
                                                        </PropertiesSpinEdit>
                                                        <DataItemTemplate>
                                                            <dx:ASPxSpinEdit ID="spApGia" runat="server" NullText="Giữ nguyên giá" />
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataSpinEditColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                            <asp:SqlDataSource ID="dsLoaiKH" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDLoaiKhachHang], [TenLoaiKhachHang] FROM [khLoaiKhachHang] WHERE IDLoaiKhachHang <> 1"></asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem HorizontalAlign="Center" ShowCaption="False" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <table>
                                                <tr>
                                                    <td style="padding-right:10px;width:110px;">
                                                        <dx:ASPxButton ID="btnSave" runat="server" Text="Thêm" ValidationGroup="checkInput" AutoPostBack="false">
                                                            <ClientSideEvents Click="onSaveClick" />
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td >
                                                        <dx:ASPxButton ID="btnRenew" runat="server" Text="Lập mới" Width="100" BackColor="#d9534f" AutoPostBack="false">
                                                            <ClientSideEvents Click="onRenewClick" />
                                                        </dx:ASPxButton>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>    
</asp:Content>

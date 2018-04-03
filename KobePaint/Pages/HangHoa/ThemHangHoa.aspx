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
                                            <dx:ASPxTextBox ID="txtMaHH" runat="server" Width="100%" NullText="Hệ thống tự tạo nếu để trống.">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Số lượng">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit ID="formThemHH_E3" runat="server" Number="0" Width="100%">
                                            </dx:ASPxSpinEdit>
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
                                <dx:LayoutItem Caption="ĐVT">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <table>
                                                <tr>
                                                    <td style="padding-right:10px;width:100%;">
                                                        <dx:ASPxComboBox ID="ccbDVT" runat="server" DataSourceID="dsDVT" Width="100%" NullText="--chọn đvt--">
                                                            <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="checkInput">
                                                                <RequiredField ErrorText="Chọn đơn vị tính" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxComboBox>  
                                                        <asp:SqlDataSource ID="dsDVT" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT * FROM [hhDonViTinh] WHERE ([DaXoa] = @DaXoa)">
                                                        <SelectParameters>
                                                                <asp:Parameter DefaultValue="False" Name="DaXoa" Type="Boolean" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>    
                                                    </td>
                                                    <td style="padding-right:10px;width:5px;">
                                                        <dx:ASPxButton ID="btnThemDVT" runat="server" Text="Thêm">
                                                             <ClientSideEvents Click="onAddDVTClick" />
                                                        </dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Giá vốn">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit ID="spGiaVon" runat="server" Width="100%" Number="0">
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Giá bán">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit ID="spGiaBan" runat="server" DisplayFormatString="N0" Increment="5000" Number="0" Width="100%">
                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="checkInput">
                                                    <RequiredField ErrorText="Chưa nhập thông tin" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem HorizontalAlign="Center" ShowCaption="False" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <table>
                                                <tr>
                                                    <td style="padding-right:10px;width:110px;">
                                                        <dx:ASPxButton ID="btnSave" runat="server" Text="Lưu" ValidationGroup="checkInput" AutoPostBack="false">
                                                            <ClientSideEvents Click="onSaveClick" />
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td style="padding-right:10px;width:110px;">
                                                        <dx:ASPxButton ID="btnLuuTiepTuc" runat="server" Text="Lưu và tiếp tục" ValidationGroup="checkInput" AutoPostBack="false">
                                                           <%-- <ClientSideEvents Click="onSaveClick" />--%>
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

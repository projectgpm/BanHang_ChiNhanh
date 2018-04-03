<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="LapThanhToanNCC.aspx.cs" Inherits="KobePaint.Pages.ThanhToan.LapThanhToanNCC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function onCCBKhachHangChanged(s, e) {
            cbpThanhToan.PerformCallback('Customer');
        }
        function onCCBPhieuNhapKhoChanged() {
            cbpSoTienDaTT.PerformCallback('PhieuTT');
        }
        function initCCBHinhThuc(s, e) {
            if (s.GetSelectedIndex() == 0) {
                SetVisiblePhieuTT(false);
            }
            else {
                SetVisiblePhieuTT(true);
            }
        }
        function onCCBHinhThucChanged(s, e) {
            if (s.GetSelectedIndex() == 0) {
                SetVisiblePhieuTT(false);
            }
            else {
                SetVisiblePhieuTT(true);
            }
        }
        function SetVisiblePhieuTT(bVisible) {
            formThanhToan.GetItemByName('itemPhieuTT').SetVisible(bVisible);
            formThanhToan.GetItemByName('itemSoTienDaTT').SetVisible(bVisible);
        }
        function onClickSavePrint() {
            if (speSoTienTT.GetValue() == 0) {
                alert("Chưa nhập số tiền thanh toán");
                return;
            }
            if (rdlHinhThuc.GetSelectedIndex() == 0) {
                var TongNo = Number(txtCongNoHienTai.GetText());
                var Tra = Number(speSoTienTT.GetValue());
                if (Tra > TongNo) {
                    var r = confirm("Số tiền thanh toán không được nhập quá số tổng công nợ /n Bạn có muốn sửa số tiền thanh toán và lưu?");
                    if (r == true) {
                        speSoTienTT.SetValue(TongNo);
                        SavePrint();
                    }
                }
                else {
                    SavePrint();
                }
            }
            else {
                var PhieuNo = Number(hiddenfield.Get("TienNo"));
                var Tra = Number(speSoTienTT.GetValue());
                if (Tra > PhieuNo) {
                    var r = confirm("Số tiền thanh toán không được nhập quá số công nợ trên phiếu /n Bạn có muốn sửa số tiền thanh toán và lưu?");
                    if (r == true) {
                        speSoTienTT.SetValue(PhieuNo);
                        SavePrint();
                    }
                }
                else {
                    SavePrint();
                }
            }
        }
        function SavePrint() {
            cbpThanhToan.PerformCallback('SavePrint');
        }              
    </script>
    <dx:ASPxCallbackPanel ID="cbpThanhToan" ClientInstanceName="cbpThanhToan" runat="server" Width="100%" OnCallback="cbpThanhToan_Callback">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="formThanhToan" ClientInstanceName="formThanhToan" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Lập phiếu thanh toán" ColCount="2" GroupBoxDecoration="HeadingLine" HorizontalAlign="Center">
                            <Items>
                                <dx:LayoutItem Caption="Khách hàng">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ccbKhachHang" ClientInstanceName="ccbKhachHang" runat="server" Width="100%" DataSourceID="dsKhachHang" NullText="--- chọn khách hàng ---" ValueField="IDKhachHang" TextField="HoTen">
                                                <ClientSideEvents SelectedIndexChanged="onCCBKhachHangChanged" />
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE [LoaiKhachHangID] = 1"></asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Công nợ hiện tại" HelpText="(Đvt: đồng)">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtCongNoHienTai" ClientInstanceName="txtCongNoHienTai" runat="server" Width="100%" ReadOnly="true" DisplayFormatString="N0">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                    <HelpTextStyle ForeColor="#00CC00" Wrap="False"></HelpTextStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Hình thức thanh toán" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxRadioButtonList ID="rdlHinhThuc" ClientInstanceName="rdlHinhThuc" runat="server" ItemSpacing="50px" RepeatColumns="2" SelectedIndex="0">
                                                <ClientSideEvents SelectedIndexChanged="onCCBHinhThucChanged" Init="initCCBHinhThuc" />
                                                <Items>
                                                    <dx:ListEditItem Selected="True" Text="Công nợ giảm dần" Value="0" />
                                                    <dx:ListEditItem Text="Theo phiếu giao hàng" Value="1" />
                                                </Items>
                                                <Border BorderStyle="None" />
                                            </dx:ASPxRadioButtonList>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Phiếu thanh toán" Name="itemPhieuTT" ClientVisible="false">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ccbPhieuNhapKho" runat="server" Width="100%" NullText="--Chọn phiếu thanh toán--" ValueField="IDNhapKho" TextFormatString="Đơn nhập {0} - {1} đồng">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="STT" FieldName="MaPhieu" />
                                                    <dx:ListBoxColumn Caption="Tổng tiền" FieldName="TongDonHang" />
                                                </Columns>
                                                <ClientSideEvents SelectedIndexChanged="onCCBPhieuNhapKhoChanged" />
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Số tiền đã thanh toán" HelpText="(Đvt: đồng)" Name="itemSoTienDaTT" ClientVisible="false">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxCallbackPanel ID="cbpSoTienDaTT" ClientInstanceName="cbpSoTienDaTT" runat="server" Width="100%" OnCallback="cbpSoTienDaTT_Callback">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxTextBox ID="txtSoTienDaTT" runat="server" Width="100%" ReadOnly="true" DisplayFormatString="N0">
                                                        </dx:ASPxTextBox>
                                                        <dx:ASPxHiddenField ID="hiddenfield" ClientInstanceName="hiddenfield" runat="server"></dx:ASPxHiddenField>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxCallbackPanel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                    <HelpTextStyle ForeColor="#00CC00" Wrap="False"></HelpTextStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Số tiền thanh toán" ColSpan="2" HelpText="(Đvt: đồng)">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit ID="speSoTienTT" ClientInstanceName="speSoTienTT" runat="server" Number="0" DecimalPlaces="2" Increment="5000" Width="100%" DisplayFormatString="N0">
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                    <HelpTextStyle ForeColor="#00CC00" Wrap="False"></HelpTextStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Số hóa đơn">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtHoaDon" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Ngày thanh toán">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="dateNgayTT" runat="server" Width="100%" OnInit="dateEditControl_Init">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Nội dung thanh toán" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxMemo ID="memoNoiDungTT" runat="server" Rows="5" Width="100%">
                                            </dx:ASPxMemo>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutItem HorizontalAlign="Center" ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <table style="width:100%;">
                                        <tr>                                            
                                            <td style="padding-right:10px;text-align:right;width:50%;">
                                                <dx:ASPxButton ID="btnSavePrint" runat="server" Text="Thanh toán và In phiếu" Width="100" AutoPostBack="false" UseSubmitBehavior="true">
                                                    <ClientSideEvents Click="onClickSavePrint" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td>
                                                <dx:ASPxButton ID="btnRenew" runat="server" Text="Lập mới" Width="100" BackColor="#d9534f" OnClick="btnRenew_Click" UseSubmitBehavior="false">
                                                </dx:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</asp:Content>

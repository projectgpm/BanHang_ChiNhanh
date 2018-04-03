<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ThemKH.aspx.cs" Inherits="KobePaint.Pages.KH_NCC.ThemKH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <dx:ASPxFormLayout ID="formThemKH" ClientInstanceName="formThemKH" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Thêm khách hàng mới" GroupBoxDecoration="HeadingLine" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Mã khách hàng">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtMaKH" runat="server" Width="100%" Font-Bold="True" ForeColor="Red">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="Loại khách hàng">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ccbLoaiKH" runat="server" Width="100%" DataSourceID="dsLoaiKH" TextField="TenLoaiKhachHang" ValueField="IDLoaiKhachHang" SelectedIndex="0">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                    if(s.GetSelectedIndex() != 0)
                                        {       
                                            ccbNhanVienPT.SetSelectedIndex(-1);                                   
                                            formThemKH.GetItemByName('layoutitemNVPT').SetVisible(false);
                                        }
                                        else
                                        {                                            
                                            formThemKH.GetItemByName('layoutitemNVPT').SetVisible(true);
                                        }
                                    }" />
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="dsLoaiKH" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDLoaiKhachHang], [TenLoaiKhachHang] FROM [khLoaiKhachHang] WHERE DaXoa = 0"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nhân viên phụ trách" Name="layoutitemNVPT">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ccbNhanVienPT" runat="server" Width="100%" ClientInstanceName="ccbNhanVienPT" DataSourceID="dsNhanVien" TextField="HoTen" ValueField="IDNhanVien">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT IDNhanVien, HoTen FROM nvNhanVien WHERE (DaXoa = 0) AND (NhomID &lt;&gt; 1)"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tên khách hàng">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtTenKH" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Điện thoại">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtDienThoai" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Địa chỉ" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtDiaChi" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Mã số thuế">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtMaSoThue" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Hạn mức công nợ" HelpText="(Đvt: đồng)">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="speHanMucCongNo" runat="server" Width="100%" DecimalPlaces="2" DisplayFormatString="N0" Increment="1000" NullText="0">
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                        <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                        </HelpTextStyle>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Thời hạn thanh toán" HelpText="(Đvt: ngày)">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="speThoiHanThanhToan" runat="server" Width="100%" NullText="0">
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                        <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                        </HelpTextStyle>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Công nợ ban đầu" HelpText="(Đvt: đồng)">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="speCongNoBanDau" runat="server" Width="100%" DecimalPlaces="2" DisplayFormatString="N0" Increment="1000" NullText="0">
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                        <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                        </HelpTextStyle>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Thông tin khác" ColSpan="2" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="mmoThongTinKhac" runat="server" Rows="4" Width="100%">
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="2" HorizontalAlign="Center" ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="padding-right:10px;text-align:right;width:50%;">
                                            <dx:ASPxButton ID="btnLuu" runat="server" Text="Lưu" Width="100" OnClick="btnLuu_Click">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxHyperLink runat="server" ID="linkCancel" Text="Nhập lại" NavigateUrl="~/Pages/KH-NCC/ThemKH.aspx">
                                            </dx:ASPxHyperLink>
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
    <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
        InsertCommand="INSERT INTO khKhachHang(MaKhachHang, LoaiKhachHangID, HoTen, DiaChi, DienThoai, MaSoThue, GhiChu, NhanVienPhuTrachID, TongCongNo, HanMucCongNo, ThoiHanThanhToan) VALUES (@MaKhachHang, @LoaiKhachHangID, @HoTen, @DiaChi, @DienThoai, @MaSoThue, @GhiChu, @NhanVienPhuTrachID, @TongCongNo, @HanMucCongNo, @ThoiHanThanhToan)" SelectCommand="SELECT khKhachHang.* FROM khKhachHang">
        <InsertParameters>
            <asp:ControlParameter ControlID="formThemKH$txtMaKH" Name="MaKhachHang" PropertyName="Text" />
            <asp:ControlParameter ControlID="formThemKH$ccbLoaiKH" Name="LoaiKhachHangID" PropertyName="Value" />
            <asp:ControlParameter ControlID="formThemKH$ccbNhanVienPT" Name="NhanVienPhuTrachID" PropertyName="Value" />
            <asp:ControlParameter ControlID="formThemKH$txtTenKH" Name="HoTen" PropertyName="Text" />
            <asp:ControlParameter ControlID="formThemKH$txtDienThoai" Name="DiaChi" PropertyName="Text" />
            <asp:ControlParameter ControlID="formThemKH$txtDiaChi" Name="DienThoai" PropertyName="Text" />
            <asp:ControlParameter ControlID="formThemKH$txtMaSoThue" Name="MaSoThue" PropertyName="Text" />
            <asp:ControlParameter ControlID="formThemKH$mmoThongTinKhac" Name="GhiChu" PropertyName="Text" />            
            <asp:ControlParameter ControlID="formThemKH$speCongNoBanDau" Name="TongCongNo" PropertyName="Value" DefaultValue="0" />
            <asp:ControlParameter ControlID="formThemKH$speHanMucCongNo" Name="HanMucCongNo" PropertyName="Value" DefaultValue="0" />
            <asp:ControlParameter ControlID="formThemKH$speThoiHanThanhToan" Name="ThoiHanThanhToan" PropertyName="Value" DefaultValue="0"/>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

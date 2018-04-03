<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="LapThanhToanChietKhau.aspx.cs" Inherits="KobePaint.Pages.ThanhToan.LapThanhToanChietKhau" %>
<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxCallbackPanel ID="cbpTTChietKhau" ClientInstanceName="cbpTTChietKhau" runat="server" Width="100%" OnCallback="cbpTTChietKhau_Callback">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <script>
                    function onKhachHangChanged() {
                        cbpTTChietKhau.PerformCallback("Customer");
                    }
                    function onClickSavePrint() {
                        cbpTTChietKhau.PerformCallback('SavePrint');
                    }
                    function onReviewClick() {
                        if (ccbKhachHang.GetSelectedIndex() == -1) {
                            alert("Chưa chọn khách hàng");
                            return;
                        }
                        cbpTTChietKhau.PerformCallback('Review');
                    }
                    function onEndCallBack(s, e) {
                        if (s.cp_rpView) {
                            hiddenfield.Set('view', '1');
                            popupViewReport.Show();
                            reportViewer.GetViewer().Refresh();
                            delete (s.cp_rpView);
                        }
                    }
                </script>
                <dx:ASPxFormLayout ID="formThongTin" runat="server" ClientInstanceName="formThongTin" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Lập phiếu thanh toán chiết khấu" ColCount="2" GroupBoxDecoration="HeadingLine" HorizontalAlign="Center" Width="100%">
                            <Items>
                                <dx:LayoutItem Caption="CHỌN KHÁCH HÀNG" ColSpan="2" HorizontalAlign="Center">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ccbKhachHang" ClientInstanceName="ccbKhachHang" runat="server" Width="300px" DataSourceID="dsKhachHang" DisplayFormatString="{0}" NullText="---Chọn khách hàng---" ValueField="IDKhachHang">
                                                <ClientSideEvents SelectedIndexChanged="onKhachHangChanged" />
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="Họ tên" FieldName="HoTen" />
                                                    <dx:ListBoxColumn Caption="Địa chỉ" FieldName="DiaChi" />
                                                    <dx:ListBoxColumn Caption="Điện thoại" FieldName="DienThoai" />
                                                </Columns>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen], [DiaChi], [DienThoai] FROM [khKhachHang] WHERE ([LoaiKhachHangID] &lt;&gt; @LoaiKhachHangID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="1" Name="LoaiKhachHangID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionStyle ForeColor="Red" Font-Bold="true">
                                    </CaptionStyle>
                                </dx:LayoutItem>
                                <dx:LayoutGroup Caption="Thông tin" Width="40%">
                                    <GroupBoxStyle>
                                        <Caption Font-Size="15px">
                                        </Caption>
                                    </GroupBoxStyle>
                                    <Items>
                                        <dx:LayoutItem Caption="Tổng công nợ" HelpText="(Đvt: đồng)">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtTongCongNo" runat="server" Width="100%" DisplayFormatString="N0" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                            <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                                            </HelpTextStyle>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Đã thanh toán" HelpText="(Đvt: đồng)">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtDaThanhToan" runat="server" Width="100%" DisplayFormatString="N0" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                            <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                                            </HelpTextStyle>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tổng chiết khấu" HelpText="(Đvt: đồng)">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtTongCK" runat="server" Width="100%" DisplayFormatString="N0" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                            <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                                            </HelpTextStyle>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tiền đã tạm ứng" HelpText="(Đvt: đồng)">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtDaTamUng" runat="server" Width="100%" DisplayFormatString="N0" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                            <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                                            </HelpTextStyle>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Chiết khấu đã thanh toán" HelpText="(Đvt: đồng)" >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtCKDaTT" runat="server" Width="100%" DisplayFormatString="N0" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                            <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                                            </HelpTextStyle>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Thanh toán" Width="60%">
                                    <GroupBoxStyle>
                                        <Caption Font-Size="15px">
                                        </Caption>
                                    </GroupBoxStyle>
                                    <Items>
                                        <dx:LayoutItem Caption="Cần thanh toán" HelpText="(Đvt: đồng)" >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtCanThanhToan" runat="server" Width="100%" ForeColor="Red" DisplayFormatString="N0" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                            <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                                            </HelpTextStyle>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Chiết khấu thanh toán" HelpText="(Đvt: đồng)" >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="txtCKConLai" runat="server" Width="100%" ForeColor="Blue" DisplayFormatString="N0" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                            <HelpTextStyle ForeColor="#00CC00" Wrap="False">
                                            </HelpTextStyle>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Nội dung thanh toán">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxMemo ID="memoNoiDung" runat="server" Rows="4" Width="100%">
                                                    </dx:ASPxMemo>
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
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutItem ColSpan="2" HorizontalAlign="Center" ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td style="padding-right:10px;text-align:right;width:50%;">
                                                        <dx:ASPxButton ID="btnReview" runat="server" Text="Xem trước" Width="100" BackColor="#5cb85c" AutoPostBack="False">
                                                            <ClientSideEvents Click="onReviewClick" />
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td style="padding-right:10px;width:110px;">
                                                        <dx:ASPxButton ID="btnSavePrint" runat="server" Text="Thanh toán và In phiếu" Width="100" AutoPostBack="false" UseSubmitBehavior="true">
                                                            <ClientSideEvents Click="onClickSavePrint" />
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxButton ID="btnRenew" runat="server" Text="Lập mới" Width="100" BackColor="#d9534f" UseSubmitBehavior="false">
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
                    <Styles>
                        <LayoutItem>
                            <HelpText Font-Italic="True">
                            </HelpText>
                            <Paddings PaddingTop="0px" />
                        </LayoutItem>
                    </Styles>
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
        <ClientSideEvents EndCallback="onEndCallBack" />
    </dx:ASPxCallbackPanel>
    <dx:ASPxPopupControl ID="popupViewReport" ClientInstanceName="popupViewReport" runat="server" HeaderText="Phiếu xuất hàng" Width="800px" PopupHorizontalAlign="WindowCenter" >
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxDocumentViewer ID="reportViewer" ClientInstanceName="reportViewer" runat="server">
                </dx:ASPxDocumentViewer>        
                <dx:ASPxHiddenField ID="hiddenfield" ClientInstanceName="hiddenfield" runat="server"></dx:ASPxHiddenField>        
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="LapTamUng.aspx.cs" Inherits="KobePaint.Pages.ThanhToan.LapTamUng" %>
<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function ccbNhanVienSelectedChange()
        {
            cbpTamUng.PerformCallback('GetCustomer');
        }
        function ccbKhachHangSelectedChange()
        {
            cbpTamUng.PerformCallback('GetOldDebt');
        }
        function onReviewClick()
        {
            if(checkInput())
                cbpTamUng.PerformCallback('Review');
        }
        function onEndCallBack(s, e) {
            if (s.cp_rpView) {
                hdfViewReport.Set('view', '1');
                popupViewReport.Show();
                reportViewer.GetViewer().Refresh();
                delete (s.cp_rpView);
            }
        }
        function checkInput()
        {
            if (spTamUng.GetValue() == 0) {
                alert("Chưa nhập số tiền thanh toán");
                return false;
            };
            if (ccbKhachHang.GetSelectedIndex() == -1) {
                alert("Chưa chọn khách hàng");
                return false;
            }
            return true;
        }
        function onSaveClick()
        {
            if(checkInput())
                cbpTamUng.PerformCallback('Save');
        }        
    </script>
    <dx:ASPxCallbackPanel ID="cbpTamUng" ClientInstanceName="cbpTamUng" runat="server" Width="100%" OnCallback="cbpTamUng_Callback">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="formThongTin" ClientInstanceName="formThongTin" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Lập phiếu tạm ứng" GroupBoxDecoration="HeadingLine" HorizontalAlign="Center" ColCount="2">
                            <Items>
                                <dx:LayoutItem Caption="Nhân viên">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ccbNhanVien" runat="server" Width="100%" DataSourceID="dsNhanVien" DisplayFormatString="{0}" ValueField="IDNhanVien">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="Họ tên" FieldName="HoTen" />
                                                    <dx:ListBoxColumn Caption="Điện thoại" FieldName="DienThoai" />
                                                </Columns>
                                                <ClientSideEvents SelectedIndexChanged="ccbNhanVienSelectedChange" />
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen], [DienThoai] FROM [nvNhanVien] WHERE ([NhomID] = @NhomID)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="3" Name="NhomID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Khách hàng">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ccbKhachHang" ClientInstanceName="ccbKhachHang" runat="server" Width="100%" DataSourceID="dsKhachHang" DisplayFormatString="{0}" ValueField="IDKhachHang">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="Họ tên" FieldName="HoTen" />
                                                    <dx:ListBoxColumn Caption="Điện thoại" FieldName="DienThoai" />
                                                    <dx:ListBoxColumn Caption="Địa chỉ" FieldName="DiaChi" />
                                                </Columns>
                                                <ClientSideEvents SelectedIndexChanged="ccbKhachHangSelectedChange" />
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [HoTen], [DienThoai], [DiaChi], [IDKhachHang] FROM [khKhachHang] WHERE ([NhanVienPhuTrachID] = @NhanVienPhuTrachID)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ccbNhanVien" Name="NhanVienPhuTrachID" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Công nợ hiện tại" HelpText="(Đvt: đồng)">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtCongNoHienTai" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                    <HelpTextStyle ForeColor="#00CC00" Wrap="False"></HelpTextStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Số tiền đã tạm ứng" HelpText="(Đvt: đồng)">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="txtDaTamUng" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                    <HelpTextStyle ForeColor="#00CC00" Wrap="False"></HelpTextStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Số tiền tạm ứng" ColSpan="2" HelpText="(Đvt: đồng)">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit ID="spTamUng" ClientInstanceName="spTamUng" runat="server" Width="100%" Font-Bold="True" ForeColor="Red" Number="0" MinValue="0">
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <HelpTextSettings Position="Right" VerticalAlign="Middle" />
                                    <HelpTextStyle ForeColor="#00CC00" Wrap="False"></HelpTextStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Nội dung tạm ứng" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxMemo ID="memoNoiDung" runat="server" Width="100%" Rows="5">
                                            </dx:ASPxMemo>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Ngày lập" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="dateNgayLap" runat="server" Width="100%" OnInit="dateEditControl_Init">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <div style="align-items:center; text-align:center;padding-top:5px;">
                                                <table style="margin: 0 auto;">
                                                    <tr>
                                                        <td style="padding-right:10px;">
                                                            <dx:ASPxButton ID="btnPreview" runat="server" Text="Xem trước" BackColor="#5cb85c" AutoPostBack="false">
                                                                <ClientSideEvents Click="onReviewClick" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxButton ID="btnSave" runat="server" Text="Lập phiếu" AutoPostBack="false" UseSubmitBehavior="true">
                                                                <ClientSideEvents Click="onSaveClick" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td style="padding-left:10px;">
                                                            <dx:ASPxButton ID="btnRenew" runat="server" Text="Lập mới" BackColor="#d9534f" UseSubmitBehavior="false" OnClick="btnRenew_Click">
                                                            </dx:ASPxButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
        <ClientSideEvents EndCallback="onEndCallBack" />
    </dx:ASPxCallbackPanel>
    <dx:ASPxPopupControl ID="popupViewReport" ClientInstanceName="popupViewReport" runat="server" HeaderText="Phiếu tạm ứng" Width="800px" Height="600px" ScrollBars="Auto" PopupHorizontalAlign="WindowCenter" >
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxCallbackPanel ID="cbpViewReport" ClientInstanceName="cbpViewReport" runat="server" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxDocumentViewer ID="reportViewer" ClientInstanceName="reportViewer" runat="server">
                            </dx:ASPxDocumentViewer>
                            <dx:ASPxHiddenField ID="hdfViewReport" ClientInstanceName="hdfViewReport" runat="server">
                            </dx:ASPxHiddenField>
                        </dx:PanelContent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="onEndCallBackViewRp" />
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

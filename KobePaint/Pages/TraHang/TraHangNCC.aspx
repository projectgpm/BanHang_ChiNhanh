<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="TraHangNCC.aspx.cs" Inherits="KobePaint.Pages.TraHang.TraHangNCC" %>
<%@ Register assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script>
         function AdjustSize() {
             var hInfoPanel = splImport.GetPaneByName('splpInfoImport').GetClientHeight();
             var hInfoLayout = flayoutInfosImport.GetHeight();
             gridImportPro.SetHeight(hInfoPanel - hInfoLayout);
         }
         
       
    </script>

    <style>
        .dxflGroupCell_Material{
            padding: 0 5px;
        }
        .dxflHeadingLineGroupBoxSys.dxflGroupBox_Material > .dxflGroup_Material > tbody > tr:first-child > .dxflGroupCell_Material > .dxflItem_Material, .dxflHeadingLineGroupBoxSys.dxflGroupBox_Material > .dxflGroup_Material > .dxflChildInFirstRowSys > .dxflGroupCell_Material > .dxflItem_Material
        {
            padding-top: 1px;
        }
    </style>
      <dx:ASPxSplitter ID="splImport" runat="server" ClientInstanceName="splImport" FullscreenMode="True" Height="100%" SeparatorVisible="False" Width="100%" Orientation="Vertical">
        <Styles>
            <Pane>
                                            
                  <Paddings Padding="0px" />
            </Pane>
        </Styles>
        <Panes>
            <dx:SplitterPane Name="splpInfo">
                <Panes>
                    <dx:SplitterPane MaxSize="350px" Name="splpInfoCustomer">
                        <ContentCollection>
                            <dx:SplitterContentControl ID="SplitterContentControl1" runat="server">
                                <dx:ASPxCallbackPanel ID="cbpInfoCustomer" ClientInstanceName="cbpInfoCustomer" runat="server" Width="100%" OnCallback="cbpInfoCustomer_Callback">
                                    <ClientSideEvents EndCallback="endCallbackInfoCustomer" />
                                    <PanelCollection>
                                        <dx:PanelContent ID="PanelContent1" runat="server">
                                            <dx:ASPxFormLayout ID="flayoutInfoNCC" runat="server" Width="100%">
                                                <Items>
                                                    <dx:LayoutGroup Caption="Thông tin đơn hàng" GroupBoxDecoration="HeadingLine">
                                                        <CellStyle>
                                                            <Paddings Padding="0px" />
                                                        </CellStyle>
                                                        <ParentContainerStyle>
                                                            <Paddings Padding="0px" />
                                                        </ParentContainerStyle>
                                                        <Items>
                                                            <dx:LayoutItem Caption="Mã phiếu">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                                        <dx:ASPxTextBox ID="txtMaPhieu" runat="server" Enabled="False" Text="Hệ thống tự tạo..." Width="100%">
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Nhà cung cấp">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                                        <dx:ASPxComboBox ID="ccbNhaCungCap" runat="server" Width="100%" DataSourceID="dsNhaCungCap" ValueField="IDKhachHang" TextField="HoTen">
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsNhaCungCap" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
                                                                            SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE (([DaXoa] = @DaXoa) AND ([LoaiKhachHangID] = @LoaiKhachHangID)) ORDER BY [HoTen]">
                                                                            <SelectParameters>
                                                                                <asp:Parameter DefaultValue="0" Name="DaXoa" Type="Int32" />
                                                                                <asp:Parameter DefaultValue="2" Name="LoaiKhachHangID" Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Ngày trả">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                                        <dx:ASPxDateEdit ID="dateNgayTra" runat="server" Width="100%" OnInit="dateNgayTra_Init">
                                                                        </dx:ASPxDateEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Nhân viên">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                                                        <dx:ASPxTextBox ID="txtTenNhanVien" runat="server" Enabled="False" Width="100%">
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Ghi chú">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                                                        <dx:ASPxMemo ID="memoGhiChu" runat="server" Rows="3" Width="100%">
                                                                        </dx:ASPxMemo>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup Caption="Thông tin thanh toán" GroupBoxDecoration="HeadingLine">
                                                        <Items>
                                                            <dx:LayoutItem Caption="Hình thức">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxCheckBox ID="ckGiamCongNo" runat="server" CheckState="Unchecked" Text="Giảm công nợ" Width="100%">
                                                                        </dx:ASPxCheckBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Tổng tiền">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="spTongTien" ClientInstanceName="spTongTien" runat="server" Enabled="False" Width="100%">
                                                                        </dx:ASPxSpinEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Đã thanh toán">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="spThanhToan" ClientInstanceName="spThanhToan" runat="server" Width="100%">
                                                                        </dx:ASPxSpinEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Còn lại">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="spConLai" ClientInstanceName="spConLai" runat="server" Enabled="False" Width="100%">
                                                                        </dx:ASPxSpinEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                </Items>
                                                <SettingsItemCaptions Location="Top" />
                                            </dx:ASPxFormLayout>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxCallbackPanel>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane Name="splpInfoImport">
                        <ContentCollection>
                            <dx:SplitterContentControl ID="SplitterContentControl2" runat="server">
                                <dx:ASPxCallbackPanel ID="cbpInfoImport" ClientInstanceName="cbpInfoImport" runat="server" Width="100%" OnCallback="cbpInfoImport_Callback" DefaultButton="btnImportToList">
                                    <ClientSideEvents EndCallback="endCallBackImport" />
                                    <PanelCollection>
                                        <dx:PanelContent ID="PanelContent2" runat="server">                                            
                                              <dx:ASPxFormLayout ID="flayoutInfosImport" ClientInstanceName="flayoutInfosImport" runat="server" Width="100%">
                                                <Items>
                                                    <dx:LayoutGroup Caption="Thông tin nhập hàng" ColCount="6" GroupBoxDecoration="HeadingLine">
                                                        <Items>
                                                            <dx:LayoutItem Caption="" ColSpan="4" ShowCaption="False" Width="100%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                                                        <dx:ASPxComboBox ID="ccbBarcode" runat="server" ValueType="System.String"
                                                                            ClientInstanceName="ccbBarcode"
                                                                            DropDownWidth="600" DropDownStyle="DropDown"
                                                                            ValueField="IDHangHoa"
                                                                            NullText="Nhập Barcode hoặc mã hàng ......." Width="100%" TextFormatString="{0} - {1}"
                                                                            EnableCallbackMode="true" CallbackPageSize="20"
                                                                            OnItemsRequestedByFilterCondition="ccbBarcode_ItemsRequestedByFilterCondition"
                                                                            OnItemRequestedByValue="ccbBarcode_ItemRequestedByValue">
                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="MaHang" Width="50px" Caption="Mã Hàng" />
                                                                                <dx:ListBoxColumn FieldName="TenHangHoa" Width="250px" Caption="Tên Hàng Hóa" />
                                                                            </Columns>
                                                                            <DropDownButton Visible="False">
                                                                            </DropDownButton>
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsHangHoa" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>">
                                                                            <SelectParameters>
                                                                                <asp:Parameter DefaultValue="0" Name="DaXoa" Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="" ShowCaption="False">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                                                        <dx:ASPxButton ID="btnImportToList" runat="server" Text="Đưa vào DS" AutoPostBack="False">
                                                                            <ClientSideEvents Click="ImportProduct" />
                                                                        </dx:ASPxButton>
                                                                        <dx:ASPxHiddenField ID="hiddenFields" runat="server"></dx:ASPxHiddenField>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Excel" ShowCaption="False">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server">
                                                                        <dx:ASPxButton ID="btnExcel" runat="server" AutoPostBack="False" ClientInstanceName="btnExcel" Text="Nhập Excel">
                                                                            <ClientSideEvents Click="onExcelClick" />
                                                                        </dx:ASPxButton>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                </Items>
                                                <SettingsItemCaptions Location="Top" />
                                            </dx:ASPxFormLayout>

                                            <dx:ASPxGridView ID="gridImportPro" ClientInstanceName="gridImportPro" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="STT" OnRowDeleting="gridImportPro_RowDeleting">
                                                <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="0" ShowFooter="True"/>
                                                <SettingsPager Mode="ShowAllRecords">
                                                </SettingsPager>
                                                <SettingsCommandButton>
                                                    <ShowAdaptiveDetailButton ButtonType="Image">
                                                    </ShowAdaptiveDetailButton>
                                                    <HideAdaptiveDetailButton ButtonType="Image">
                                                    </HideAdaptiveDetailButton>
                                                    <DeleteButton ButtonType="Image" RenderMode="Image">
                                                        <Image IconID="actions_cancel_16x16">
                                                        </Image>
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                                <SettingsText EmptyDataRow="Chưa có dữ liệu" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Tên hàng hóa" FieldName="ProductName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Mã HH" FieldName="ProductNum" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="MSM" FieldName="Color" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="ĐVT" FieldName="Measure" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Số lượng" FieldName="Unit" ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Đơn giá" FieldName="Price" ShowInCustomizationForm="True" VisibleIndex="6">
                                                        <PropertiesTextEdit DisplayFormatString="N0">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Thành tiền" FieldName="Total" ShowInCustomizationForm="True" VisibleIndex="7">
                                                        <PropertiesTextEdit DisplayFormatString="N0">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewCommandColumn Caption="Xóa" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="50px">
                                                    </dx:GridViewCommandColumn>
                                                </Columns>
                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="Tổng tiền: {0:N0}" FieldName="Total" ShowInColumn="Thành tiền" SummaryType="Sum" />
                                                </TotalSummary>
                                            </dx:ASPxGridView>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxCallbackPanel>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
                <ContentCollection>
                    <dx:SplitterContentControl ID="SplitterContentControl3" runat="server">
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="splpProcess" MaxSize="100px" Size="100px">
                <ContentCollection>
                    <dx:SplitterContentControl ID="SplitterContentControl4" runat="server">
                        <div style="align-items:center; text-align:center;padding-top:5px;">
                            <table style="margin: 0 auto;">
                                <tr>
                                    <td style="padding-right:10px;">
                                        <dx:ASPxButton ID="btnPreview" runat="server" Text="Xem trước" BackColor="#5cb85c" AutoPostBack="False">
                                            <ClientSideEvents Click="onReviewClick" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnSave1" runat="server" Text="Đặt hàng" AutoPostBack="False">
                                            
                                            <ClientSideEvents Click="onSaveClick" />
                                            
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="padding-left:10px;">
                                        <dx:ASPxButton ID="btnRenew" runat="server" Text="Lập mới" BackColor="#d9534f" AutoPostBack="False">
                                            <ClientSideEvents Click="onRenewClick" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>


    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
    </dx:ASPxGlobalEvents>
   
</asp:Content>

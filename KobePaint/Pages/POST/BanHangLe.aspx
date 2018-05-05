<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BanHangLe.aspx.cs" Inherits="KobePaint.Pages.POST.BanHangLe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <script type="text/javascript"  src="/Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript">

        function UpdateControlHeight(contrSet) {
            contrSet.SetHeight(0);
            var containerHeight = ASPxClientUtils.GetDocumentClientHeight();
            if (document.body.scrollHeight > containerHeight)
                containerHeight = document.body.scrollHeight;
            contrSet.SetHeight(containerHeight - headerPane.GetHeight());
        }
        function UpdateHeightControlInPage(contrSet, hfix) {
            contrSet.SetHeight(0);
            var containerHeight = ASPxClientUtils.GetDocumentClientHeight();
            if (document.body.scrollHeight > containerHeight)
                containerHeight = document.body.scrollHeight;
            contrSet.SetHeight(containerHeight - headerPane.GetHeight() - hfix);
        }
        function ShowPopup(mi) {
            popupThongBao.Show();
            setTimeout(function () {
                popupThongBao.Hide();
            }, mi);
        }
        function AdjustSize() {
            var hInfoPanel = splImport.GetPaneByName('splpInfoImport').GetClientHeight();
            var hInfoLayout = flayoutInfosImport.GetHeight();
            gridImportPro.SetHeight(hInfoPanel - hInfoLayout);
        }
    </script>
    <style>
        .dxgvGroupRow_Material td.dxgv{
            padding-top: 6px;
            padding-bottom: 6px;
        }
        .dxgvDataRow_Material td.dxgv{
            padding-top: 6px;
            padding-bottom: 6px;
        }
        .dxgvSearchPanel_Material .dxeButtonEdit_Material .dxic
        {
            padding: 5px 10px 5px 12px;
        }
        .dxgvSearchPanel_Material{
            padding: 7px 0 10px;
        }
        /*Calendar Popup*/
        .dxeCalendar_Material
        {
            font: 11px 'Roboto Medium', Helvetica, 'Droid Sans', Tahoma, Geneva, sans-serif;
        }
        .dxeCalendar_Material td.dxMonthGrid > table{
            padding-right: 0px;
            padding-left: 0px;
        }
        .dxeCalendarDayHeader_Material
        {
            padding: 5px 4px 5px;
            font-size: 1em;
        }
        .dxeCalendarDay_Material{
            padding: 5px 5px 5px 5px;
        }
        .dxeCalendar_Material td.dxMonthGridWithWeekNumbers > table > tbody > tr > td:first-child {
            padding: 5px 5px 5px 5px;
        }
        .dxeCalendarSelected_Material, .dxeCalendarToday_Material
        {
            background-repeat: no-repeat;
            background-position: center 2px;
            background-size: 20px 20px;
        }
        .dxeCalendar_Material td.dxMonthGridWithWeekNumbers > table > tbody > tr:last-child > td, .dxeCalendar_Material td.dxMonthGrid > table > tbody > tr:last-child > td
        {
            padding-bottom: 15px;
        }
        
    </style>
      <style>
        .dxflGroupCell_Material {
            padding: 0 5px;
        }

        .dxflHeadingLineGroupBoxSys.dxflGroupBox_Material > .dxflGroup_Material > tbody > tr:first-child > .dxflGroupCell_Material > .dxflItem_Material, .dxflHeadingLineGroupBoxSys.dxflGroupBox_Material > .dxflGroup_Material > .dxflChildInFirstRowSys > .dxflGroupCell_Material > .dxflItem_Material {
            padding-top: 1px;
        }
    </style>
</head>
<body runat="server" id="Body">
    <form id="form1" runat="server">
        <dx:ASPxPanel ID="HeaderPane" runat="server" FixedPosition="WindowTop" ClientInstanceName="headerPane" CssClass="headerPane" Collapsible="true">
            <SettingsAdaptivity CollapseAtWindowInnerWidth="800" />
            <Styles>
                <Panel CssClass="panel"></Panel>
                <ExpandedPanel CssClass="expandedPanel"></ExpandedPanel>
                <ExpandBar CssClass="bar"></ExpandBar>
            </Styles>
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                        <div class="headerTop">
                            <div class="logo">
                               <%-- <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Content/Images/logo.png" CssClass="imglogo" />--%>
                            </div>
                            <div class="templateTitle">
                                <a id="TitleLink" href="~/" runat="server">QUẢN LÝ BÁN HÀNG</a>
                            </div>                           
                        </div>
                        <div class="headerMenu">
                            <%-- DXCOMMENT: Configure the header menu --%>

                            <table style="width:99%; margin-right:14px;">
                                <tr style="width:100%; ">
                                    <td>
                                        <dx:ASPxMenu ID="HeaderMenu" runat="server" CssClass="headerMenu" ClientInstanceName="headerMenu" ItemAutoWidth="False" Width="100%" DataSourceID="XmlDataSourceHeader" SeparatorHeight="0px" SeparatorWidth="0px" BackColor="#1F77C0" SeparatorColor="#1F77C0">
                                            <ItemStyle BackColor="#1F77C0" ForeColor="White" Font-Names="&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">
                                            <SelectedStyle BackColor="#FF9906" Font-Bold="True">
                                            </SelectedStyle>
                                            <HoverStyle Font-Bold="True">
                                            </HoverStyle>
                                            <Border BorderColor="#1F77C0" />
                                            </ItemStyle>
                                            <LoadingPanelStyle BackColor="#1F77C0">
                                            </LoadingPanelStyle>
                                            <SubMenuItemStyle>
                                                <SelectedStyle BackColor="#FF9906">
                                                </SelectedStyle>
                                            </SubMenuItemStyle>
                                        </dx:ASPxMenu>
                                    </td>
                                    <td style="width:90px;text-align:right;background-color:#1F77C0;">
                                        <dx:ASPxButton ID="btnBanHang" runat="server" Text="POS bán lẻ" Width="80px" PostBackUrl="~/Pages/POST/BanHangLe.aspx" BackColor="#FF9906" UseSubmitBehavior="false">
                                            <HoverStyle BackColor="#F0A000">
                                            </HoverStyle>
                                        </dx:ASPxButton>                                        
                                    </td>
                                </tr>
                            </table>

                        </div>
                </dx:PanelContent>
            </PanelCollection>
            <ExpandBarTemplate>
                <div class="templateTitle">
                    <a id="TitleLink" href="~/" runat="server">QUẢN LÝ BÁN HÀNG</a>
                </div>
            </ExpandBarTemplate>
        </dx:ASPxPanel>
         
        <script type="text/javascript">
            function updateHeaderMenuOrientation() {
                var orientation = headerPane.IsExpandable() ? 'Vertical' : 'Horizontal';
                if (orientation !== headerMenu.GetOrientation())
                    headerMenu.SetOrientation(orientation);
            }
        </script>

        <dx:ASPxPanel ID="MainPane" runat="server" CssClass="mainContentPane">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">
                   <dx:ASPxPanel ID="panelImport" runat="server" Width="100%" DefaultButton="btnImportToList">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent3" runat="server">
                            <dx:ASPxSplitter ID="splImport" runat="server" ClientInstanceName="splImport" FullscreenMode="True" Height="100%" SeparatorVisible="False" Width="100%" Orientation="Vertical">
                                <Styles>
                                    <Pane>
                                        <Paddings Padding="0px" />
                                    </Pane>
                                </Styles>
                                <Panes>
                                    <dx:SplitterPane Name="splpInfo">
                                        <Panes>
                                            <dx:SplitterPane Name="splpInfoImport">
                                                <ContentCollection>
                                                    <dx:SplitterContentControl ID="SplitterContentControl2" runat="server">
                                                        <dx:ASPxCallbackPanel ID="cbpInfoImport" ClientInstanceName="cbpInfoImport" runat="server" Width="100%" OnCallback="cbpInfoImport_Callback">
                                                            <PanelCollection>
                                                                <dx:PanelContent ID="PanelContent5" runat="server">

                                                                    <dx:ASPxGridView ID="gridImportPro" ClientInstanceName="gridImportPro" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="STT" OnRowDeleting="gridImportPro_RowDeleting">
                                                                        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="0" ShowFooter="True" />
                                                                        <SettingsPager Mode="ShowAllRecords">
                                                                        </SettingsPager>
                                                                        <SettingsBehavior AllowSort="False" />
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
                                                                            <dx:GridViewDataTextColumn Caption="Tên hàng hóa" FieldName="TenHangHoa" ShowInCustomizationForm="True" VisibleIndex="2" Width="100%">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="Mã HH" FieldName="MaHang" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewCommandColumn Caption="Xóa" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="50px">
                                                                            </dx:GridViewCommandColumn>
                                                                            <dx:GridViewDataTextColumn Caption="TK" FieldName="TonKho" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataSpinEditColumn Caption="Thành tiền" FieldName="ThanhTien" ShowInCustomizationForm="True" VisibleIndex="6" Width="150px">
                                                                                <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                                                                                </PropertiesSpinEdit>
                                                                            </dx:GridViewDataSpinEditColumn>
                                                                            <dx:GridViewDataSpinEditColumn Caption="Giá vốn" FieldName="GiaVon" ShowInCustomizationForm="True" VisibleIndex="5" Width="150px">
                                                                                <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                                                                <DataItemTemplate>
                                                                                    <dx:ASPxSpinEdit ID="spGiaVonReturn" runat="server" Number='<%# Convert.ToDouble(Eval("GiaVon")) %>' Width="100%" DisplayFormatString="N0" NumberType="Integer" OnInit="spGiaVonReturn_Init" Increment="5000" HorizontalAlign="Right">
                                                                                    </dx:ASPxSpinEdit>
                                                                                </DataItemTemplate>
                                                                                <CellStyle>
                                                                                    <Paddings Padding="2px" />
                                                                                </CellStyle>
                                                                            </dx:GridViewDataSpinEditColumn>
                                                                            <dx:GridViewDataSpinEditColumn Caption="Số lượng" FieldName="SoLuong" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                                                <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                                                                <DataItemTemplate>
                                                                                    <dx:ASPxSpinEdit ID="spUnitReturn" runat="server" Number='<%# Convert.ToInt32(Eval("SoLuong")) %>' DisplayFormatString="N0" Width="100%" NumberType="Integer" OnInit="spUnitReturn_Init" HorizontalAlign="Center">
                                                                                    </dx:ASPxSpinEdit>
                                                                                </DataItemTemplate>
                                                                                <CellStyle>
                                                                                    <Paddings Padding="2px" />
                                                                                </CellStyle>
                                                                            </dx:GridViewDataSpinEditColumn>
                                                                            <dx:GridViewDataSpinEditColumn Caption="Giá bán" FieldName="GiaBanMoi" ShowInCustomizationForm="True" VisibleIndex="8" Width="150px">
                                                                                <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                                                                <DataItemTemplate>
                                                                                    <dx:ASPxSpinEdit ID="spGiaBanReturn" runat="server" Number='<%# Convert.ToInt32(Eval("GiaBanMoi")) %>' DisplayFormatString="N0" Width="100%" NumberType="Integer" OnInit="spGiaBanReturn_Init" Increment="5000" HorizontalAlign="Right">
                                                                                    </dx:ASPxSpinEdit>
                                                                                </DataItemTemplate>
                                                                                <CellStyle>
                                                                                    <Paddings Padding="2px" />
                                                                                </CellStyle>
                                                                            </dx:GridViewDataSpinEditColumn>
                                                                        </Columns>
                                                                        <FormatConditions>
                                                                            <dx:GridViewFormatConditionHighlight FieldName="TonKho" Expression="[TonKho] < 1" Format="LightRedFillWithDarkRedText" />
                                                                            <dx:GridViewFormatConditionHighlight FieldName="TonKho" Expression="[TonKho] > 0" Format="GreenFillWithDarkGreenText" />
                                                                            <dx:GridViewFormatConditionTopBottom FieldName="TonKho" Rule="TopItems" Threshold="15" Format="BoldText" CellStyle-HorizontalAlign="Center">
                                                                                <CellStyle HorizontalAlign="Center"></CellStyle>
                                                                            </dx:GridViewFormatConditionTopBottom>
                                                                        </FormatConditions>
                                                                        <TotalSummary>
                                                                            <dx:ASPxSummaryItem DisplayFormat="Tổng mặt hàng: {0:N0}" FieldName="MaHang" ShowInColumn="Mã HH" SummaryType="Count" />
                                                                            <dx:ASPxSummaryItem DisplayFormat="Tổng tiền: {0:N0}" FieldName="ThanhTien" ShowInColumn="Thành tiền" SummaryType="Sum" />
                                                                            <dx:ASPxSummaryItem DisplayFormat="Tổng: {0:N0}" FieldName="SoLuong" ShowInColumn="Số lượng" SummaryType="Sum" />
                                                                        </TotalSummary>
                                                                    </dx:ASPxGridView>
                                                                </dx:PanelContent>
                                                            </PanelCollection>
                                                            <ClientSideEvents EndCallback="endCallBackProduct" />
                                                        </dx:ASPxCallbackPanel>
                                                    </dx:SplitterContentControl>
                                                </ContentCollection>
                                            </dx:SplitterPane>
                                             <dx:SplitterPane MaxSize="300px" Name="splpInfoNCC"  >
                                                <ContentCollection>
                                                    <dx:SplitterContentControl ID="SplitterContentControl1" runat="server">
                                                         <dx:ASPxCallbackPanel ID="cbpInfo" ClientInstanceName="cbpInfo" runat="server" Width="100%" OnCallback="cbpInfo_Callback">
                                                            <PanelCollection>
                                                                <dx:PanelContent ID="PanelContent4" runat="server">
                                                                    <dx:ASPxFormLayout ID="flayoutInfoNCC" runat="server" Width="100%">
                                                                        <Items>
                                                                            <dx:LayoutGroup Caption="Thông tin nhà cung cấp" GroupBoxDecoration="HeadingLine">
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
                                                                                                <dx:ASPxTextBox ID="txtMaPhieu" runat="server" Enabled="False" Text="Hệ thống tự tạo" Width="100%">
                                                                                                </dx:ASPxTextBox>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                        <CaptionSettings Location="Left" />
                                                                                    </dx:LayoutItem>
                                                                                    <dx:LayoutItem Caption="Nhà cung cấp">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td style="width: 90%">
                                                                                                            <dx:ASPxComboBox ID="ccbNhaCungCap" ClientInstanceName="ccbNhaCungCap" runat="server" NullText="Chọn nhà cung cấp" Width="100%" DataSourceID="dsNhaCungCap" TextField="HoTen" ValueField="IDKhachHang" OnCallback="ccbNhaCungCap_Callback">
                                                                                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="InfosInput">
                                                                                                                    <RequiredField ErrorText="Chọn nhà cung cấp" IsRequired="True" />
                                                                                                                </ValidationSettings>
                                                                                                                <ClientSideEvents DropDown="function(s,e){ LoadNhacCungCap(); }" SelectedIndexChanged="GetPrice"></ClientSideEvents>
                                                                                                            </dx:ASPxComboBox>
                                                                                                            <asp:SqlDataSource ID="dsNhaCungCap" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE ([LoaiKhachHangID] = @LoaiKhachHangID)">
                                                                                                                <SelectParameters>
                                                                                                                    <asp:Parameter DefaultValue="2" Name="LoaiKhachHangID" Type="Int32" />
                                                                                                                </SelectParameters>
                                                                                                            </asp:SqlDataSource>
                                                                                                        </td>
                                                                                                        <td style="width: 10%; padding-left: 10px;">
                                                                                                            <dx:ASPxHyperLink ID="hpThemNCC" Target="_blank" runat="server" Text="Thêm" NavigateUrl="/Pages/KhachHang/ThemKH.aspx">
                                                                                                            </dx:ASPxHyperLink>

                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                    </dx:LayoutItem>
                                                                                    <dx:LayoutItem Caption="Ngày nhập">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                                                                <dx:ASPxDateEdit ID="dateNgayNhap" runat="server" OnInit="dateEditControl_Init" Width="100%">
                                                                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                                                                        <RequiredField ErrorText="Không được để trống" IsRequired="True" />
                                                                                                    </ValidationSettings>
                                                                                                </dx:ASPxDateEdit>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                        <CaptionSettings Location="Left" />
                                                                                    </dx:LayoutItem>
                                                                                    <dx:LayoutItem Caption="Số hóa đơn">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                                                                                <dx:ASPxTextBox ID="txtSoHoaDon" runat="server" Width="100%">
                                                                                                </dx:ASPxTextBox>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                        <CaptionSettings Location="Left" />
                                                                                    </dx:LayoutItem>
                                                                                    <dx:LayoutItem Caption="Người nhập">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                                                                                <dx:ASPxTextBox ID="txtNguoiNhap" runat="server" Enabled="False" Width="100%">
                                                                                                </dx:ASPxTextBox>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                        <CaptionSettings Location="Left" />
                                                                                    </dx:LayoutItem>
                                                                                    <dx:LayoutItem Caption="Tổng tiền" FieldName="TongTien">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                                                                                <dx:ASPxSpinEdit Number="0" ID="spTongTien" ClientInstanceName="spTongTien" DisplayFormatString="N0" Increment="5000" HorizontalAlign="Right" Width="100%" runat="server" Font-Bold="true" ForeColor="Blue" Enabled ="false">
                                                                                                </dx:ASPxSpinEdit>

                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                        <CaptionSettings Location="Left" />
                                                                                    </dx:LayoutItem>
                                                                                  <dx:LayoutItem Caption="Thanh toán" FieldName="ThanhToan">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server">
                                                                                                <dx:ASPxSpinEdit Number="0" ID="spThanhToan" ClientInstanceName="spThanhToan" DisplayFormatString="N0" Increment="5000" HorizontalAlign="Right" Width="100%" runat="server" Font-Bold="true" ForeColor="Blue">
                                                                                   
                                                                                                </dx:ASPxSpinEdit>

                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                        <CaptionSettings Location="Left" />
                                                                                    </dx:LayoutItem>
                                                                                    <dx:LayoutItem Caption="Thông tin khác">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                                                                                <dx:ASPxMemo ID="memoGhiChu" runat="server" Rows="5" Width="100%">
                                                                                                </dx:ASPxMemo>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
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
                                        </Panes>
                                        <ContentCollection>
                                            <dx:SplitterContentControl ID="SplitterContentControl3" runat="server">
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                </Panes>
                            </dx:ASPxSplitter>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
                <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
                    <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
                </dx:ASPxGlobalEvents>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
 

        <dx:ASPxPopupControl ID="popupThongBao" ClientInstanceName="popupThongBao" runat="server" 
            Height="150px" ShowHeader="False" Width="150px" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            BackColor="Transparent" PopupAction="None"
            EnableHierarchyRecreation="True" PopupAnimationType="Fade" ShowOnPageLoad="False" ShowShadow="False">
            <Border BorderWidth="0px" />
            <ContentStyle>
                <Border BorderStyle="None" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <dx:ASPxImage ID="imgSuccess" ClientInstanceName="imgSuccess" runat="server" ShowLoadingImage="True" ImageUrl="~/Content/Images/success.gif" Width="150px" Height="150px" >
                        <Border BorderStyle="None" />
                    </dx:ASPxImage>                
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
<%-- DXCOMMENT: Configure the header menu --%>
<asp:XmlDataSource ID="XmlDataSourceHeader" runat="server" DataFile="~/App_Data/MenuToanQuyen.xml"
    XPath="/items/*"></asp:XmlDataSource>
    </form>
</body>
</html>
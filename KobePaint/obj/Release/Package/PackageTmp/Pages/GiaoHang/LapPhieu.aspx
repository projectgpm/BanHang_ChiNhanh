<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="LapPhieu.aspx.cs" Inherits="KobePaint.Pages.GiaoHang.LapPhieu" %>
<%@ Register assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function AdjustSize() {
            var hInfoPanel = splImport.GetPaneByName('splpInfoImport').GetClientHeight();
            var hInfoLayout = flayoutInfosImport.GetHeight();
            gridImportPro.SetHeight(hInfoPanel - hInfoLayout);
        }
        var CustomerSelectedBefore = 0;
        function ccbCustomerSelectedIndexChanged(s, e) {
            cbpInfoCustomer.PerformCallback(CustomerSelectedBefore);            
        }
        function endCallbackInfoCustomer(s, e)
        {
            if (s.cp_Reset) {
                CustomerSelectedBefore = 0;
                delete (s.cp_Reset);
            }
            else {
                CustomerSelectedBefore = ccbCustomer.GetValue();
                cbpInfoImport.PerformCallback('Customer');
            }
        }
        function onCCBProductChange() {
            if (ccbCustomer.GetSelectedIndex() == -1) {
                alert('Vui lòng chọn nhà cung cấp trước');
                ccbProduct.SetSelectedIndex(-1);
                ccbCustomer.Focus();
            }
            else
            {
                cbpInfoImport.PerformCallback('Color');
            }
        }
        function onCCBColorChange()
        {
            if (ccbProduct.GetSelectedIndex() == -1) {
                alert('Vui lòng chọn hàng hóa trước');
                ccbColor.SetSelectedIndex(-1);
                ccbProduct.Focus();
            }
            else {
                cbpInfoImport.PerformCallback('Price');
            }
        }
        function ImportProduct()
        {
            if (ccbCustomer.GetSelectedIndex() == -1) {
                alert('Vui lòng chọn khách hàng');
                return;
            }
            if (ccbProduct.GetSelectedIndex() == -1) {
                alert('Vui lòng chọn hàng hóa');
                return;
            }
            if (ccbColor.GetSelectedIndex() == -1) {
                alert('Vui lòng chọn mã màu');
                return;
            }
            if(CheckUnits())
                cbpInfoImport.PerformCallback("Import");
        }        
        function CheckUnits()
        {
            var InventoryUnit = Number(txtInventoryUnits.GetText());
            var OrderUnit = Number(speOrderUnits.GetValue());
            if (InventoryUnit < OrderUnit) {
                alert("Số lượng tồn không đủ");
                speOrderUnits.SetIsValid(false);
                speOrderUnits.SetErrorText('Tồn không đủ');
                return false;
            }
            else
            {
                if (OrderUnit == 0)
                {
                    alert("Chưa nhập số lượng");
                    speOrderUnits.SetIsValid(false);
                    speOrderUnits.SetErrorText('Nhập SL');
                    return false;
                }
                else
                    return true;
            }
        }
        function onReviewClick()
        {
            cbpInfoImport.PerformCallback('Review');            
        }
        function onSaveClick()
        {
            if (gridImportPro.GetVisibleRowsOnPage() > 0)
                cbpInfoImport.PerformCallback('Save');
            else
                alert("Chưa có hàng hóa nào trong danh sách");
        }
        function onRenewClick()
        {
            cbpInfoImport.PerformCallback('Renew');
        }
        function endCallBackImport(s, e)
        {
            console.log(s.cp_rpView);
            if (s.cp_rpView) {
                hdfViewReport.Set('view', '1');
                popupViewReport.Show();
                reportViewer.GetViewer().Refresh();
                delete (s.cp_rpView);
            }
            if(s.cp_Reset)
            {
                cbpInfoCustomer.PerformCallback('Reset');
                delete (s.cp_Reset);
                ShowPopup(4000);
            }
            if (s.cp_Renew)
            {
                cbpInfoCustomer.PerformCallback('Renew');
                delete (s.cp_Renew);
            }
        }
        function endCallbackViewReport()
        {
            popupViewReport.Show();
            reportViewer.GetViewer().Refresh();
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
                    <dx:SplitterPane MaxSize="300px" Name="splpInfoCustomer">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <dx:ASPxCallbackPanel ID="cbpInfoCustomer" ClientInstanceName="cbpInfoCustomer" runat="server" Width="100%" OnCallback="cbpInfoCustomer_Callback">
                                    <ClientSideEvents EndCallback="endCallbackInfoCustomer" />
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <dx:ASPxFormLayout ID="flayoutInfoNCC" runat="server" Width="100%">
                                                <Items>
                                                    <dx:LayoutGroup Caption="Thông tin khách hàng" GroupBoxDecoration="HeadingLine">
                                                        <CellStyle>
                                                            <Paddings Padding="0px" />
                                                        </CellStyle>
                                                        <ParentContainerStyle>
                                                            <Paddings Padding="0px" />
                                                        </ParentContainerStyle>
                                                        <Items>
                                                            <dx:LayoutItem Caption="Chọn khách hàng">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ccbCustomer" ClientInstanceName="ccbCustomer" runat="server" NullText="---Chọn khách hàng---" Width="100%" DataSourceID="dsCustomer" TextField="HoTen" ValueField="IDKhachHang">
                                                                            <ClientSideEvents SelectedIndexChanged="ccbCustomerSelectedIndexChanged" />
                                                                            <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="InfosInput">
                                                                                <RequiredField ErrorText="Chọn khách hàng" IsRequired="True" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE ([LoaiKhachHangID] <> @LoaiKhachHangID)">
                                                                            <SelectParameters>
                                                                                <asp:Parameter DefaultValue="1" Name="LoaiKhachHangID" Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Số hóa đơn">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxTextBox ID="txtReceiptNum" runat="server" Width="100%">
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Ngày đặt hàng">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxDateEdit ID="dateOrder" runat="server" OnInit="dateEditControl_Init" Width="100%">
                                                                            <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                                                <RequiredField ErrorText="Không được để trống" IsRequired="True" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxDateEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Ngày xuất hàng">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxDateEdit ID="dateDispatch" runat="server" Width="100%" OnInit="dateEditControl_Init">
                                                                        </dx:ASPxDateEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Số xe">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ccbLicensePlate" runat="server" Width="100%" DataSourceID="dsXe" TextField="BienSo" ValueField="IDXe">
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsXe" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDXe], [BienSo] FROM [nvXe] WHERE [DaXoa] = 0"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Tài xế">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ccbDriver" runat="server" Width="100%" DataSourceID="dsTaiXe" TextField="HoTen" ValueField="IDNhanVien">
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsTaiXe" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDNhanVien], [HoTen] FROM [nvNhanVien] WHERE [NhomID] = 5 AND [DaXoa] = 0"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                                <CaptionSettings Location="Left" />
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Ghi chú">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxMemo ID="memoAdditionInfo" runat="server" Rows="5" Width="100%">
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
                    <dx:SplitterPane Name="splpInfoImport">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <dx:ASPxCallbackPanel ID="cbpInfoImport" ClientInstanceName="cbpInfoImport" runat="server" Width="100%" OnCallback="cbpInfoImport_Callback" DefaultButton="btnImportToList">
                                    <ClientSideEvents EndCallback="endCallBackImport" />
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">                                            
                                            <dx:ASPxFormLayout ID="flayoutInfosImport" ClientInstanceName="flayoutInfosImport" runat="server" Width="100%">
                                                <Items>
                                                    <dx:LayoutGroup Caption="Thông tin đặt hàng" ColCount="7" GroupBoxDecoration="HeadingLine">
                                                        <Items>
                                                            <dx:LayoutItem Caption="Chọn hàng hóa">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ccbProduct" ClientInstanceName="ccbProduct" runat="server" DataSourceID="dsProduct" ValueField="IDHangHoa" TextFormatString="{1}" NullText="--chọn hàng--">
                                                                            <Columns>
                                                                                <dx:ListBoxColumn Caption="Mã số" FieldName="MaSo" />
                                                                                <dx:ListBoxColumn Caption="Tên" FieldName="TenHangHoa" />
                                                                                <dx:ListBoxColumn Caption="Đvt" FieldName="QuiCach" />
                                                                            </Columns>
                                                                            <ClientSideEvents SelectedIndexChanged="onCCBProductChange" />
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" 
                                                                            SelectCommand="SELECT DISTINCT [IDHangHoa], [TenHangHoa], [QuiCach], [MaSo] 
	                                                                        FROM [hhHangHoa] INNER JOIN [kTonKho] ON [hhHangHoa].IDHangHoa = [kTonKho].HangHoaID"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Mã màu">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ccbColor" ClientInstanceName="ccbColor" runat="server" NullText="--Chọn mã màu--" TextField="MaSoMau" ValueField="IDMaMau" DataSourceID="dsColor" >
                                                                            <ClientSideEvents SelectedIndexChanged="onCCBColorChange" />
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsColor" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT hhMaSoMau.IDMaMau, hhMaSoMau.MaSoMau FROM hhMaSoMau INNER JOIN kTonKho ON hhMaSoMau.IDMaMau = kTonKho.MaSoMauID WHERE (kTonKho.HangHoaID = @IDHangHoa)">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="ccbProduct" Name="IDHangHoa" PropertyName="Value" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Số lượng tồn">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxTextBox ID="txtInventoryUnits" ClientInstanceName="txtInventoryUnits" runat="server" Width="100%" Text="0" ReadOnly="true">
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Số lượng">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="speOrderUnits" ClientInstanceName="speOrderUnits" runat="server" Number="1" MaxValue="162345" MinValue="1" NumberType="Integer" Width="100%">
                                                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" ErrorText="Quá số tồn" ErrorTextPosition="Bottom">
                                                                            </ValidationSettings>
                                                                        </dx:ASPxSpinEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Đơn giá">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="spePrice" runat="server" Number="0" Increment="5000" DisplayFormatString="N0" ReadOnly="True">
                                                                        </dx:ASPxSpinEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="CK (%)">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="speDiscount" runat="server" Number="0" Increment="1" NumberType="Float" DecimalPlaces="2" DisplayFormatString="g" Width="100%">
                                                                        </dx:ASPxSpinEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="" ShowCaption="False">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxButton ID="btnImportToList" runat="server" Text="Đưa vào DS" AutoPostBack="false">
                                                                            <ClientSideEvents Click="ImportProduct"/>
                                                                        </dx:ASPxButton>
                                                                        <dx:ASPxHiddenField ID="hiddenFields" runat="server">
                                                                        </dx:ASPxHiddenField>
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
                    <dx:SplitterContentControl runat="server">
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="splpProcess" MaxSize="100px" Size="100px">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
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
    <dx:ASPxPopupControl ID="popupViewReport" ClientInstanceName="popupViewReport" runat="server" HeaderText="Phiếu xuất hàng" Width="800px" Height="600px" ScrollBars="Auto" PopupHorizontalAlign="WindowCenter" >
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxDocumentViewer ID="reportViewer" ClientInstanceName="reportViewer" runat="server">
                </dx:ASPxDocumentViewer>
                <dx:ASPxHiddenField ID="hdfViewReport" ClientInstanceName="hdfViewReport" runat="server">
                </dx:ASPxHiddenField>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
    </dx:ASPxGlobalEvents>    
</asp:Content>

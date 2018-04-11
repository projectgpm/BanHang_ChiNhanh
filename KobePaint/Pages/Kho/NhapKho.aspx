<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="NhapKho.aspx.cs" Inherits="KobePaint.Pages.Kho.NhapKho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function AdjustSize() {
            var hInfoPanel = splImport.GetPaneByName('splpInfoImport').GetClientHeight();
            var hInfoLayout = flayoutInfosImport.GetHeight();
            gridImportPro.SetHeight(hInfoPanel - hInfoLayout);
        }

        function GetPrice()
        {
            if (ccbNhaCungCap.GetSelectedIndex() == -1) {
                alert('Vui lòng chọn nhà cung cấp trước');
                ccbBarcode.SetSelectedIndex(-1);
                ccbNhaCungCap.Focus();
            }
            else {
                if (ccbBarcode.GetSelectedIndex() != -1) {  
                    cbpInfoImport.PerformCallback('price');
                }
            }
        }
        function ImportProduct()
        {
            if (ccbNhaCungCap.GetSelectedIndex() == -1)
            {
                ccbBarcode.SetSelectedIndex(-1);
                ccbNhaCungCap.Focus();
                alert('Vui lòng chọn nhà cung cấp');
                return;
            }
            
            cbpInfoImport.PerformCallback("import");
        }

        function LoadNhacCungCap() {
            ccbNhaCungCap.PerformCallback();
        }
        function onSaveClick() {
            cbpInfoImport.PerformCallback('Save');
        }
        function onSaveTempClick() {
            cbpInfoImport.PerformCallback('SaveTemp');
        }
        function onReviewClick() {
            cbpInfoImport.PerformCallback('Review');
        }
        ///////////////////////////////////
        function onUnitReturnChanged(key) {
            cbpInfoImport.PerformCallback('UnitChange|' + key);
        }

        function endCallBackProduct(s, e) {
            if (s.cp_rpView) {
                hdfViewReport.Set('view', '1');
                popupViewReport.Show();
                reportViewer.GetViewer().Refresh();
                delete (s.cp_rpView);
            }
            if (s.cp_Reset) {
                cbpInfoImport.PerformCallback('Reset');
                delete (s.cp_Reset);
                ShowPopup(4000);
            }
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

    <dx:ASPxPanel ID="panelImport" runat="server" Width="100%" DefaultButton="btnImportToList">
        <PanelCollection>
        <dx:PanelContent runat="server">
    <dx:ASPxSplitter ID="splImport" runat="server" ClientInstanceName="splImport" FullscreenMode="True" Height="100%" SeparatorVisible="False" Width="100%" Orientation="Vertical">
        <Styles>
            <Pane>
                <Paddings Padding="0px" />
            </Pane>
        </Styles>
        <Panes>
            <dx:SplitterPane Name="splpInfo">
                <Panes>
                    <dx:SplitterPane MaxSize="300px" Name="splpInfoNCC" AutoHeight="true">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
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
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtMaPhieu" runat="server" Enabled="False" Text="Hệ thống tự tạo" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Nhà cung cấp">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                           <table>
                                                               <tr>
                                                                   <td style="width:90%">
                                                                        <dx:ASPxComboBox ID="ccbNhaCungCap" ClientInstanceName="ccbNhaCungCap" runat="server" NullText="Chọn nhà cung cấp" Width="100%" DataSourceID="dsNhaCungCap" TextField="HoTen" ValueField="IDKhachHang" OnCallback="ccbNhaCungCap_Callback">
                                                                            <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="InfosInput">
                                                                                <RequiredField ErrorText="Chọn nhà cung cấp" IsRequired="True" />
                                                                            </ValidationSettings>
                                                                            <ClientSideEvents DropDown="function(s,e){ LoadNhacCungCap(); }"  SelectedIndexChanged="GetPrice" ></ClientSideEvents>
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsNhaCungCap" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE ([LoaiKhachHangID] = @LoaiKhachHangID)">
                                                                            <SelectParameters>
                                                                                <asp:Parameter DefaultValue="2" Name="LoaiKhachHangID" Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                   </td>
                                                                   <td style="width:10%;padding-left:10px;">
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
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxDateEdit ID="dateNgayNhap" runat="server" OnInit="dateEditControl_Init" Width="100%">
                                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                                    <RequiredField ErrorText="Không được để trống" IsRequired="True" />
                                                                </ValidationSettings>
                                                            </dx:ASPxDateEdit>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Số hóa đơn">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtSoHoaDon" runat="server" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Người nhập">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtNguoiNhap" runat="server" Enabled="False" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                              
                                                <dx:LayoutItem Caption="Thông tin khác">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
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
                                 <dx:ASPxFormLayout ID="flThanhToan" ClientInstanceName="flThanhToan" runat="server" Width="100%">
                                    <Items>
                                        <dx:LayoutGroup Caption="Thông tin thanh toán" GroupBoxDecoration="HeadingLine">
                                            <CellStyle>
                                                <Paddings Padding="0px" />
                                            </CellStyle>
                                            <ParentContainerStyle>
                                                <Paddings Padding="0px" />
                                            </ParentContainerStyle>
                                            <Items>
                                                <dx:LayoutItem Caption="Tổng cộng" FieldName="TongTien">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                            <dx:ASPxSpinEdit ID="spTongCong" DisplayFormatString="N0" Enabled="false" HorizontalAlign="Right" Number="0" Width="100%" runat="server">
                                                            </dx:ASPxSpinEdit>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Thanh toán" FieldName="ThanhToan">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                            <dx:ASPxSpinEdit ID="spThanhToan" DisplayFormatString="N0" Increment ="5000" HorizontalAlign="Right" Number="0" Width="100%" runat="server" Font-Bold="true" ForeColor="Blue" >
                                                            </dx:ASPxSpinEdit>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Còn nợ" FieldName="ConLai">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                            <dx:ASPxSpinEdit ID="spConNo" DisplayFormatString="N0"  Enabled="false" HorizontalAlign="Right" Number="0" Width="100%"  runat="server">
                                                            </dx:ASPxSpinEdit>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                    </Items>
                                    <SettingsItemCaptions Location="Top" />
                                </dx:ASPxFormLayout>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane Name="splpInfoImport">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <dx:ASPxCallbackPanel ID="cbpInfoImport" ClientInstanceName="cbpInfoImport" runat="server" Width="100%" OnCallback="cbpInfoImport_Callback">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <dx:ASPxFormLayout ID="flayoutInfosImport" ClientInstanceName="flayoutInfosImport" runat="server" Width="100%">
                                                <Items>
                                                    <dx:LayoutGroup Caption="Thông tin nhập hàng" ColCount="6" GroupBoxDecoration="HeadingLine">
                                                        <Items>
                                                            <dx:LayoutItem Caption="" ColSpan="5" ShowCaption="False" Width="100%">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ccbBarcode" runat="server" ValueType="System.String" 
                                                                             ClientInstanceName="ccbBarcode"
                                                                            DropDownWidth="600" DropDownStyle="DropDown" 
                                                                            ValueField="IDHangHoa"
                                                                            NullText="Nhập Barcode hoặc mã hàng ......." Width="100%" TextFormatString="{0} - {1}"
                                                                            EnableCallbackMode="true" CallbackPageSize="20" 
                                                                            OnItemsRequestedByFilterCondition="ccbBarcode_ItemsRequestedByFilterCondition"
                                                                            OnItemRequestedByValue="ccbBarcode_ItemRequestedByValue" 
                                    
                                                                            >                                    
                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="MaHang" Width="50px" Caption="Mã Hàng" />
                                                                                <dx:ListBoxColumn FieldName="TenHangHoa" Width="250px" Caption="Tên Hàng Hóa"/>
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
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxButton ID="btnImportToList" runat="server" Text="Đưa vào DS" AutoPostBack="false">
                                                                            <ClientSideEvents Click="ImportProduct"/>
                                                                        </dx:ASPxButton>
                                                                        <dx:ASPxHiddenField ID="hiddenFields" runat="server"></dx:ASPxHiddenField>
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
                                                    <dx:GridViewDataTextColumn Caption="Tên hàng hóa" FieldName="TenHangHoa" ShowInCustomizationForm="True" VisibleIndex="2" Width="100%">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Mã HH" FieldName="MaHang" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewCommandColumn Caption="Xóa" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="50px">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn Caption="TK" FieldName="TonKho" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px" >
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataSpinEditColumn Caption="Thành tiền" FieldName="ThanhTien" ShowInCustomizationForm="True" VisibleIndex="8" Width="150px">
                                                        <PropertiesSpinEdit DisplayFormatString="N0" NumberFormat="Custom">
                                                        </PropertiesSpinEdit>
                                                    </dx:GridViewDataSpinEditColumn>
                                                    <dx:GridViewDataSpinEditColumn Caption="Giá vốn" FieldName="GiaVon" ShowInCustomizationForm="True" VisibleIndex="7" Width="150px">
<PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                                        <DataItemTemplate>
                                                            <dx:ASPxSpinEdit ID="spGiaVonReturn" runat="server" Number='<%# Convert.ToDouble(Eval("GiaVon")) %>' Width="100%" DisplayFormatString="N0" NumberType="Integer" OnInit="spGiaVonReturn_Init"  Increment="5000" HorizontalAlign="Right">
                                                            </dx:ASPxSpinEdit>
                                                        </DataItemTemplate>
                                                        <CellStyle>
                                                            <Paddings Padding="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataSpinEditColumn>
                                                    <dx:GridViewDataSpinEditColumn Caption="Số lượng" FieldName="SoLuong" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px">
<PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                                       <DataItemTemplate>
                                                            <dx:ASPxSpinEdit ID="spUnitReturn" runat="server" Number='<%# Convert.ToInt32(Eval("SoLuong")) %>' DisplayFormatString="N0"  Width="100%" NumberType="Integer" OnInit="spUnitReturn_Init" HorizontalAlign="Center">
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
                                                    <dx:GridViewFormatConditionTopBottom FieldName="TonKho" Rule="TopItems" Threshold="15" Format="BoldText"  CellStyle-HorizontalAlign="Center">
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
                </Panes>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="splpProcess" MaxSize="100px" Size="100px">
                <ContentCollection>
                    <dx:SplitterContentControl ID="SplitterContentControl1" runat="server">
                        <div style="align-items:center; text-align:center;padding-top:5px;">
                            <table style="margin: 0 auto;">
                                <tr>
                                    <td style="padding-right:10px;">
                                        <dx:ASPxButton ID="btnPreview" runat="server" Text="Xem trước" BackColor="#5cb85c" AutoPostBack="false" UseSubmitBehavior="false">
                                            <ClientSideEvents Click="onReviewClick" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnLuuTemp" runat="server" Text="Lưu tạm" AutoPostBack="false" UseSubmitBehavior="false">
                                            <ClientSideEvents Click="onSaveTempClick" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="padding-left:10px">
                                        <dx:ASPxButton ID="btnLuuVaIn" runat="server" Text="Lưu" AutoPostBack="false" UseSubmitBehavior="false">
                                            <ClientSideEvents Click="onSaveClick" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="padding-left:10px;">
                                        <dx:ASPxButton ID="btnRenew" runat="server" Text="Trở về" BackColor="#d9534f" AutoPostBack="true" PostBackUrl="~/Pages/Kho/DanhSachNhapKho.aspx" UseSubmitBehavior="false">
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
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
    <dx:ASPxGlobalEvents ID="globalEventGrid" runat="server">
        <ClientSideEvents BrowserWindowResized="AdjustSize" ControlsInitialized="AdjustSize" />
    </dx:ASPxGlobalEvents>
     <dx:ASPxPopupControl ID="popupViewReport" ClientInstanceName="popupViewReport" runat="server" HeaderText="Phiếu xuất hàng" Width="800px" Height="600px" ScrollBars="Auto" PopupHorizontalAlign="WindowCenter" >
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
             <%--   <dx:ASPxDocumentViewer ID="reportViewer" ClientInstanceName="reportViewer" runat="server">
                </dx:ASPxDocumentViewer>--%>
                <dx:ASPxHiddenField ID="hdfViewReport" ClientInstanceName="hdfViewReport" runat="server">
                </dx:ASPxHiddenField>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl> 
</asp:Content>

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
            if (ccbSupplier.GetSelectedIndex() == -1) {
                alert('Vui lòng chọn nhà cung cấp trước');
                ccbProduct.SetSelectedIndex(-1);
                ccbColor.SetSelectedIndex(-1);
                ccbSupplier.Focus();
            }
            else {
                if (ccbProduct.GetSelectedIndex() != -1) {
                    cbpInfoImport.PerformCallback('price');
                }
            }
        }
        function ImportProduct()
        {
            if (ccbSupplier.GetSelectedIndex() == -1)
            {
                alert('Vui lòng chọn nhà cung cấp');
                return;
            }
            if (ccbProduct.GetSelectedIndex() == -1)
            {
                alert('Vui lòng chọn hàng hóa');
                return;
            }
            if (ccbColor.GetSelectedIndex() == -1) {
                alert('Vui lòng chọn mã màu');
                return;
            }
            cbpInfoImport.PerformCallback("import");
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
                    <dx:SplitterPane MaxSize="300px" Name="splpInfoNCC">
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
                                                <dx:LayoutItem Caption="Chọn Nhà cung cấp">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="ccbSupplier" ClientInstanceName="ccbSupplier" runat="server" NullText="---Chọn nhà cung cấp---" Width="100%" DataSourceID="dsSupplier" TextField="HoTen" ValueField="IDKhachHang">
                                                                <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" ValidationGroup="InfosInput">
                                                                    <RequiredField ErrorText="Chọn nhà cung cấp" IsRequired="True" />
                                                                </ValidationSettings>
                                                                <ClientSideEvents SelectedIndexChanged="GetPrice" />
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="dsSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDKhachHang], [HoTen] FROM [khKhachHang] WHERE ([LoaiKhachHangID] = @LoaiKhachHangID)">
                                                                <SelectParameters>
                                                                    <asp:Parameter DefaultValue="1" Name="LoaiKhachHangID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Ngày trên phiếu">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxDateEdit ID="dateOrder" runat="server" OnInit="dateEditControl_Init" Width="100%">
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
                                                            <dx:ASPxTextBox ID="txtReceiptNum" runat="server" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Thông tin khác">
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
                                                            <dx:LayoutItem Caption="Chọn hàng hóa">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ccbProduct" ClientInstanceName="ccbProduct" runat="server" DataSourceID="dsProduct" ValueField="IDHangHoa" TextFormatString="{1}" NullText="--chọn hàng--">
                                                                            <ClientSideEvents SelectedIndexChanged="GetPrice" />
                                                                            <Columns>
                                                                                <dx:ListBoxColumn Caption="Mã số" FieldName="MaSo" />
                                                                                <dx:ListBoxColumn Caption="Tên" FieldName="TenHangHoa" />
                                                                                <dx:ListBoxColumn Caption="Đvt" FieldName="QuiCach" />
                                                                            </Columns>
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDHangHoa], [TenHangHoa], [QuiCach], [MaSo] FROM [hhHangHoa]"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Mã màu">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ccbColor" ClientInstanceName="ccbColor" runat="server" DataSourceID="dsColor" NullText="--chọn mà màu--" TextField="MaSoMau" ValueField="IDMaMau">
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="dsColor" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDMaMau], [MaSoMau] FROM [hhMaSoMau] WHERE [TrangThai] = 0"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Số lượng">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="speUnits" runat="server" Number="1" MaxValue="162345" MinValue="1" NumberType="Integer">
                                                                        </dx:ASPxSpinEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Đơn giá">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="speReceiptPrice" runat="server" Number="0" Increment="5000" DisplayFormatString="N0">
                                                                        </dx:ASPxSpinEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Giá bán">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxSpinEdit ID="speIssuePrice" runat="server" Number="0" Increment="5000" DisplayFormatString="N0">
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
                                                    <dx:GridViewDataTextColumn Caption="Đơn giá" FieldName="ReceiptPrice" ShowInCustomizationForm="True" VisibleIndex="6">
                                                        <PropertiesTextEdit DisplayFormatString="N0">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Thành tiền" FieldName="Total" ShowInCustomizationForm="True" VisibleIndex="7">
                                                        <PropertiesTextEdit DisplayFormatString="N0">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Giá bán" FieldName="IssuePrice" ShowInCustomizationForm="True" VisibleIndex="8">
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
                            <dx:ASPxButton ID="btnSave" runat="server" Text="Lưu kho" OnClick="btnCapNhat_Click">                                
                            </dx:ASPxButton>
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
</asp:Content>

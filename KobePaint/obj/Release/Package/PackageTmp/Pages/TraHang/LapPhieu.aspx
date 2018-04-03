<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="LapPhieu.aspx.cs" Inherits="KobePaint.Pages.TraHang.LapPhieu" %>

<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style type="text/css">
        #tbProduct td
        {
            vertical-align: top;
        }

        .draggingStyle
        {
            background-color: lightblue;
        }

        .targetGrid
        {
            background-color: lightcoral;
        }
    </style>
    <script type="text/javascript">
        var rowKey = -1;
        function OnControlsInitialized(s, e) {
            $('.draggableRow').draggable({ 
                helper: 'clone',
                start: function (ev, ui) {
                    var $sourceElement = $(ui.helper.context);
                    var $draggingElement = $(ui.helper);
                    var sourceGrid = ASPxClientGridView.Cast($draggingElement.hasClass("left") ? "gridFrom" : "gridTo");

                    //style elements
                    $sourceElement.addClass("draggingStyle");
                    $draggingElement.addClass("draggingStyle");
                    $draggingElement.width(sourceGrid.GetWidth());

                    //find key
                    rowKey = sourceGrid.GetRowKey(sourceGrid.GetTopVisibleIndex() + $sourceElement.index() - 1);
                },
                stop: function (e, ui) {
                    $(".draggingStyle").removeClass("draggingStyle");
                }
            });

            var settings = function (className) {
                return {
                    tolerance: "intersect",
                    accept: className,
                    drop: function (ev, ui) {
                        $(".targetGrid").removeClass("targetGrid");
                        var leftToRight = ui.helper.hasClass("left");
                        cbpProduct.PerformCallback(rowKey + "|" + leftToRight);
                    },
                    over: function (ev, ui) {
                        $(this).addClass("targetGrid");
                    },
                    out: function (ev, ui) {
                        $(".targetGrid").removeClass("targetGrid");
                    }
                };
            };

            $(".droppableLeft").droppable(settings(".right"));
            $(".droppableRight").droppable(settings(".left"));

        }
    </script>
    <script>
        function AdjustSize() {            
            var hpProduct = splReturns.GetPaneByName('splpProduct').GetClientHeight();
            gridFrom.SetHeight(hpProduct);
            gridTo.SetHeight(hpProduct);
        }
        function ccbCustomerSelectedIndexChanged()
        {
            cbpCustomer.PerformCallback('Customer');
        }
        function onEndCallBackCustomer()
        {
            cbpProduct.PerformCallback('OrderNodeChange');
        }
        function ccbOrderNodesSelectedIndexChanged()
        {
            cbpProduct.PerformCallback('OrderNodeChange');
        }
        function onUnitReturnChanged(key)
        {
            cbpProduct.PerformCallback('UnitChange|'+ key);
        }
        function onDeleteClick(key)
        {
            cbpProduct.PerformCallback(key + "|false");
        }
        function onReviewClick()
        {
            cbpProduct.PerformCallback('Review');
        }
        function onRenewClick()
        {
            cbpCustomer.PerformCallback('Renew');
        }
        function onSaveClick()
        {
            cbpProduct.PerformCallback('Save');
        }
        function endCallBackProduct(s, e) {
            if (s.cp_rpView) {
                hdfViewReport.Set('view', '1');
                popupViewReport.Show();
                reportViewer.GetViewer().Refresh();
                delete (s.cp_rpView);
            }
            if (s.cp_Reset) {
                cbpCustomer.PerformCallback('Reset');
                delete (s.cp_Reset);
                ShowPopup(4000);
            }            
        }        
    </script>
    <dx:ASPxSplitter ID="splReturns" runat="server" ClientInstanceName="splReturns" FullscreenMode="True" Height="100%" SeparatorVisible="False" Width="100%" Orientation="Vertical">
        <Styles>
            <Pane>
                <Paddings Padding="0px" />
            </Pane>
        </Styles>
        <Panes>
            <dx:SplitterPane Name="splpCustomer" MaxSize="150px">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <dx:ASPxCallbackPanel ID="cbpCustomer" runat="server" ClientInstanceName="cbpCustomer" Width="100%" OnCallback="cbpCustomer_Callback">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxFormLayout ID="formCustomer" ClientInstanceName="formCustomer" runat="server" Width="100%">
                                        <Items>
                                            <dx:LayoutGroup Caption="LẬP PHIẾU TRẢ HÀNG" ColCount="3" GroupBoxDecoration="HeadingLine">
                                                <CellStyle>
                                                    <Paddings PaddingTop="0px" />
                                                </CellStyle>
                                                <Items>
                                                    <dx:LayoutItem Caption="Chọn khách hàng">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxComboBox ID="ccbCustomer" runat="server" ClientInstanceName="ccbCustomer" DataSourceID="dsCustomer" NullText="---Chọn khách hàng---" TextField="HoTen" ValueField="IDKhachHang" Width="100%">
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
                                                    <dx:LayoutItem Caption="Ngày trả hàng">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="dateReturns" runat="server" OnInit="dateEditControl_Init" Width="100%">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Ghi chú" RowSpan="2">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxMemo ID="memoAddition" runat="server" Rows="4" Width="100%">
                                                                </dx:ASPxMemo>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Phiếu giao hàng">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxComboBox ID="ccbOrderNodes" runat="server" Width="100%" DataSourceID="dsPhieuGiaoHang" TextFormatString="Đơn hàng {0} ngày {1}" ValueField="IDPhieuGiaoHang">
                                                                    <ClientSideEvents SelectedIndexChanged="ccbOrderNodesSelectedIndexChanged" />
                                                                    <Columns>
                                                                        <dx:ListBoxColumn Caption="Số" FieldName="STTDonHang" Width="30px" />
                                                                        <dx:ListBoxColumn Caption="Ngày xuất" FieldName="NgayXuatHang" Width="100%" />
                                                                    </Columns>
                                                                </dx:ASPxComboBox>
                                                                <asp:SqlDataSource ID="dsPhieuGiaoHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT IDPhieuGiaoHang, STTDonHang, CONVERT (NVARCHAR(10), NgayXuatHang, 103) AS NgayXuatHang FROM gPhieuGiaoHang WHERE (KhachHangID = @KhachHangID) AND PheDuyet = 1 AND YEAR(NgayLap) = YEAR(GetDate())">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="ccbCustomer" Name="KhachHangID" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Ngày lưu kho">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="dateStorage" runat="server" OnInit="dateEditControl_Init" Width="100%">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                                <ParentContainerStyle>
                                                    <Paddings Padding="0px" />
                                                </ParentContainerStyle>
                                            </dx:LayoutGroup>
                                        </Items>
                                        <SettingsItemCaptions Location="Left" />
                                        <Paddings PaddingBottom="0px" />
                                        <Styles>
                                            <LayoutItem>
                                                <Paddings PaddingTop="0px" />
                                            </LayoutItem>
                                        </Styles>
                                    </dx:ASPxFormLayout>
                                </dx:PanelContent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="onEndCallBackCustomer" />
                        </dx:ASPxCallbackPanel>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="splpProduct">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <dx:ASPxCallbackPanel ID="cbpProduct" runat="server" ClientInstanceName="cbpProduct" Width="100%" OnCallback="cbpProduct_Callback">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table id="tbProduct" style="width:100%;">
                                        <tr>
                                            <td style="width:50%;">
                                                <dx:ASPxGridView ID="gridOrders" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridFrom" KeyFieldName="STT" Width="100%" OnCustomColumnDisplayText="grid_CustomColumnDisplayText">
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <Settings ShowFooter="True" VerticalScrollableHeight="50" VerticalScrollBarMode="Visible" />
                                                    <SettingsBehavior AllowSelectSingleRowOnly="True" />
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
                                                        <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Hàng hóa" FieldName="ProductName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Mã" FieldName="ProductNum" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="MSM" FieldName="Color" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="ĐVT" FieldName="Measure" ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SL" FieldName="Unit" ShowInCustomizationForm="True" VisibleIndex="5" Width="40px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Đơn giá" FieldName="Price" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px">
                                                            <PropertiesTextEdit DisplayFormatString="N0">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Thành tiền" FieldName="Total" ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                            <PropertiesTextEdit DisplayFormatString="N0">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:N0}" FieldName="Total" ShowInColumn="Thành tiền" SummaryType="Sum" />
                                                    </TotalSummary>
                                                    <Styles>
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                        <Table CssClass="droppableLeft">
                                                        </Table>
                                                        <Row CssClass="draggableRow left">
                                                        </Row>
                                                    </Styles>
                                                </dx:ASPxGridView>
                                            </td>
                                            <td>
                                                <dx:ASPxGridView ID="gridReturns" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridTo" KeyFieldName="STT" Width="100%" OnCustomColumnDisplayText="grid_CustomColumnDisplayText">
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <Settings ShowFooter="True" VerticalScrollableHeight="50" VerticalScrollBarMode="Visible" />
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
                                                        <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Hàng hóa" FieldName="ProductName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Mã" FieldName="ProductNum" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="MSM" FieldName="Color" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="ĐVT" FieldName="Measure" ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SL" FieldName="Unit" ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                                            <DataItemTemplate>
                                                                <dx:ASPxSpinEdit ID="spUnitReturn" runat="server" Number='<%# Convert.ToInt32(Eval("Unit")) %>' MinValue="1" MaxValue='<%# Convert.ToInt32(Eval("OriginalUnit")) %>' Width="76px" NumberType="Integer" OnInit="spUnitReturn_Init" HorizontalAlign="Center">
                                                                </dx:ASPxSpinEdit>
                                                            </DataItemTemplate>
                                                            <CellStyle>
                                                                <Paddings Padding="2px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Đơn giá" FieldName="Price" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px">
                                                            <PropertiesTextEdit DisplayFormatString="N0">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Thành tiền" FieldName="Total" ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                            <PropertiesTextEdit DisplayFormatString="N0">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Xóa" ShowInCustomizationForm="True" VisibleIndex="9" Width="40px">
                                                            <DataItemTemplate>
                                                                <dx:ASPxButton ID="btnXoa" runat="server" OnInit="btnXoa_Init" AutoPostBack="false" RenderMode="Link">
                                                                    <Image IconID="actions_cancel_16x16">
                                                                    </Image>
                                                                </dx:ASPxButton>
                                                            </DataItemTemplate>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="Tổng: {0:N0}" FieldName="Total" ShowInColumn="Thành tiền" SummaryType="Sum" />
                                                    </TotalSummary>
                                                    <Styles>
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                        <Table CssClass="droppableRight">
                                                        </Table>
                                                        <Row CssClass="draggableRow right">
                                                        </Row>
                                                    </Styles>
                                                </dx:ASPxGridView>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="endCallBackProduct" />
                        </dx:ASPxCallbackPanel>
                        <dx:ASPxGlobalEvents ID="ge" runat="server">
                            <ClientSideEvents ControlsInitialized="OnControlsInitialized" EndCallback="OnControlsInitialized" />
                        </dx:ASPxGlobalEvents>
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
                                        <dx:ASPxButton ID="btnPreview" runat="server" Text="Xem trước" BackColor="#5cb85c" AutoPostBack="false" UseSubmitBehavior="false">
                                            <ClientSideEvents Click="onReviewClick" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnSave" runat="server" Text="Trả hàng" AutoPostBack="false" UseSubmitBehavior="false">
                                            <ClientSideEvents Click="onSaveClick" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="padding-left:10px;">
                                        <dx:ASPxButton ID="btnRenew" runat="server" Text="Lập mới" BackColor="#d9534f" AutoPostBack="false" UseSubmitBehavior="false">
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
</asp:Content>

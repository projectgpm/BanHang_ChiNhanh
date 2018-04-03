<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="DanhSachXe.aspx.cs" Inherits="KobePaint.Pages.TaiKhoan.DanhSachXe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <dx:ASPxFormLayout ID="formThongTin" ClientInstanceName="formThongTin" runat="server" Width="100%">
         <Items>
             <dx:LayoutGroup Caption="Danh sách Xe giao hàng" Width="100%">
                 <Items>
                     <dx:LayoutItem HorizontalAlign="Right" ShowCaption="False" Width="100%">
                         <LayoutItemNestedControlCollection>
                             <dx:LayoutItemNestedControlContainer runat="server">
                                 <dx:ASPxButton ID="btnXuatExcel" runat="server" OnClick="btnXuatExcel_Click" Text="Xuất Excel">
                                 </dx:ASPxButton>
                             </dx:LayoutItemNestedControlContainer>
                         </LayoutItemNestedControlCollection>
                     </dx:LayoutItem>
                     <dx:LayoutItem Caption="Nhóm khách hàng" ShowCaption="False">
                         <LayoutItemNestedControlCollection>
                             <dx:LayoutItemNestedControlContainer runat="server">
                                 <dx:ASPxGridViewExporter ID="exproter" runat="server" ExportedRowType="All" GridViewID="gridXe">
                                 </dx:ASPxGridViewExporter>
                                 <dx:ASPxGridView ID="gridXe" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridXe" DataSourceID="dsKhachHang" KeyFieldName="IDXe" Width="100%" OnCustomColumnDisplayText="gridXe_CustomColumnDisplayText">
                                     <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowHeaderFilterButton="true"/>
                                     <SettingsBehavior ColumnResizeMode="Control" />
                                     <SettingsCommandButton>
                                         <ShowAdaptiveDetailButton ButtonType="Image">
                                         </ShowAdaptiveDetailButton>
                                         <HideAdaptiveDetailButton ButtonType="Image">
                                         </HideAdaptiveDetailButton>
                                         <newbutton buttontype="Image" rendermode="Image">
                                             <image iconid="actions_driving_32x32devav" tooltip="thêm">
                                             </image>
                                         </newbutton>
                                         <UpdateButton ButtonType="Image" RenderMode="Image">
                                            <Image IconID="save_save_32x32" ToolTip="Lưu lại tất cả thay đổi">
                                            </Image>
                                        </UpdateButton>
                                        <CancelButton ButtonType="Image" RenderMode="Image">
                                            <Image IconID="actions_cancel_32x32">
                                            </Image>
                                        </CancelButton>
                                        <EditButton ButtonType="Image" RenderMode="Image">
                                            <Image IconID="actions_edit_16x16devav" ToolTip="Sửa">
                                            </Image>
                                        </EditButton>
                                        <DeleteButton ButtonType="Image" RenderMode="Image">
                                            <Image IconID="actions_close_16x16" ToolTip="Xóa">
                                            </Image>
                                        </DeleteButton>
                                     </SettingsCommandButton>
                                     <SettingsText HeaderFilterCancelButton="Hủy" SearchPanelEditorNullText="Nhập thông tin cần tìm..." CommandBatchEditCancel="Hủy bỏ" CommandBatchEditUpdate="Lưu" PopupEditFormCaption="Cập nhật mã hóa đơn"  EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" ConfirmDelete="Bạn có chắc chắn muốn xóa?" HeaderFilterFrom="Từ" HeaderFilterLastMonth="Tháng trước" HeaderFilterLastWeek="Tuần trước" HeaderFilterLastYear="Năm trước" HeaderFilterNextMonth="Tháng sau" HeaderFilterNextWeek="Tuần sau" HeaderFilterNextYear="Năm sau" HeaderFilterOkButton="Lọc" HeaderFilterSelectAll="Chọn tất cả" HeaderFilterShowAll="Tất cả" HeaderFilterShowBlanks="Trống" HeaderFilterShowNonBlanks="Không trống" HeaderFilterThisMonth="Tháng này" HeaderFilterThisWeek="Tuần này" HeaderFilterThisYear="Năm nay" HeaderFilterTo="Đến" HeaderFilterToday="Hôm nay" HeaderFilterTomorrow="Ngày mai" HeaderFilterYesterday="Ngày hôm qua" />
                                     <SettingsPager PageSize="20">
                                         <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
                                     </SettingsPager>
                                     <Columns>
                                         <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="4">
                                         </dx:GridViewCommandColumn>
                                         <dx:GridViewDataTextColumn FieldName="IDXe" Caption="STT" ReadOnly="True" VisibleIndex="0">
                                             <Settings AllowAutoFilter="False" AllowHeaderFilter="False">
                                             </Settings>
                                             <editformsettings visible="False" />
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn FieldName="BienSo" Caption="Biển số" VisibleIndex="1">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn FieldName="HieuXe" Caption="Hiệu xe" VisibleIndex="2">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn FieldName="TrongTai" Caption="Trọng tải" VisibleIndex="3">
                                         </dx:GridViewDataTextColumn>
                                     </Columns>
                                     <Styles>
                                         <Header Wrap="True" horizontalalign="Center">
                                         </Header>
                                     </Styles>
                                 </dx:ASPxGridView>
                                 <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT [IDXe], [BienSo], [HieuXe], [TrongTai] FROM [nvXe]" DeleteCommand="DELETE FROM [nvXe] WHERE [IDXe] = @IDXe" InsertCommand="INSERT INTO [nvXe] ([BienSo], [HieuXe], [TrongTai]) VALUES (@BienSo, @HieuXe, @TrongTai)" UpdateCommand="UPDATE [nvXe] SET [BienSo] = @BienSo, [HieuXe] = @HieuXe, [TrongTai] = @TrongTai WHERE [IDXe] = @IDXe">
                                     <DeleteParameters>
                                         <asp:Parameter Name="IDXe" Type="Int32" />
                                     </DeleteParameters>
                                     <InsertParameters>
                                         <asp:Parameter Name="BienSo" Type="String" />
                                         <asp:Parameter Name="HieuXe" Type="String" />
                                         <asp:Parameter Name="TrongTai" Type="String" />
                                     </InsertParameters>
                                     <UpdateParameters>
                                         <asp:Parameter Name="BienSo" Type="String" />
                                         <asp:Parameter Name="HieuXe" Type="String" />
                                         <asp:Parameter Name="TrongTai" Type="String" />
                                         <asp:Parameter Name="IDXe" Type="Int32" />
                                     </UpdateParameters>
                                 </asp:SqlDataSource>
                             </dx:LayoutItemNestedControlContainer>
                         </LayoutItemNestedControlCollection>
                     </dx:LayoutItem>
                 </Items>
                 <SettingsItemCaptions Location="Left" />
             </dx:LayoutGroup>
         </Items>
         <Styles>
             <LayoutItem>
                 <Paddings PaddingTop="0px" />
             </LayoutItem>
         </Styles>
     </dx:ASPxFormLayout>
</asp:Content>

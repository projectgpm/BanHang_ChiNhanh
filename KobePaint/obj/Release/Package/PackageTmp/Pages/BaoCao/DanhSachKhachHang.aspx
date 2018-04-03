<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="DanhSachKhachHang.aspx.cs" Inherits="KobePaint.Pages.BaoCao.DanhSachKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxFormLayout ID="formThongTin" ClientInstanceName="formThongTin" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Danh sách khách hàng" Width="100%">
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
                                <dx:ASPxGridViewExporter ID="exproter" runat="server" ExportedRowType="All" GridViewID="gridKhachHang">
                                </dx:ASPxGridViewExporter>
                                <dx:ASPxGridView ID="gridKhachHang" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridKhachHang" DataSourceID="dsKhachHang" KeyFieldName="IDKhachHang" Width="100%" OnCustomColumnDisplayText="gridKhachHang_CustomColumnDisplayText">
                                    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowHeaderFilterButton="true"/>
                                    <SettingsBehavior ColumnResizeMode="Control" />
                                    <SettingsCommandButton>
                                        <ShowAdaptiveDetailButton ButtonType="Image">
                                        </ShowAdaptiveDetailButton>
                                        <HideAdaptiveDetailButton ButtonType="Image">
                                        </HideAdaptiveDetailButton>
                                    </SettingsCommandButton>
                                    <SettingsText HeaderFilterCancelButton="Hủy" SearchPanelEditorNullText="Nhập thông tin cần tìm..." CommandBatchEditCancel="Hủy bỏ" CommandBatchEditUpdate="Lưu" PopupEditFormCaption="Cập nhật mã hóa đơn"  EmptyDataRow="Không có dữ liệu" CommandCancel="Hủy" ConfirmDelete="Bạn có chắc chắn muốn xóa?" HeaderFilterFrom="Từ" HeaderFilterLastMonth="Tháng trước" HeaderFilterLastWeek="Tuần trước" HeaderFilterLastYear="Năm trước" HeaderFilterNextMonth="Tháng sau" HeaderFilterNextWeek="Tuần sau" HeaderFilterNextYear="Năm sau" HeaderFilterOkButton="Lọc" HeaderFilterSelectAll="Chọn tất cả" HeaderFilterShowAll="Tất cả" HeaderFilterShowBlanks="Trống" HeaderFilterShowNonBlanks="Không trống" HeaderFilterThisMonth="Tháng này" HeaderFilterThisWeek="Tuần này" HeaderFilterThisYear="Năm nay" HeaderFilterTo="Đến" HeaderFilterToday="Hôm nay" HeaderFilterTomorrow="Ngày mai" HeaderFilterYesterday="Ngày hôm qua" />
                                    <SettingsPager PageSize="20">
                                        <Summary EmptyText="Không có dữ liệu" Text="Trang {0}/{1}" />
                                    </SettingsPager>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="IDKhachHang" Caption="STT" ReadOnly="True" VisibleIndex="0" Width="50px">
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="HoTen" Caption="Họ tên" VisibleIndex="2">
                                            <SettingsHeaderFilter Mode="CheckedList">
                                            </SettingsHeaderFilter>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="DiaChi" Caption="Địa chỉ" VisibleIndex="5">
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="MaKhachHang" Caption="Mã KH" VisibleIndex="1">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="DienThoai" Caption="Điện thoại" VisibleIndex="4">
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="MaSoThue" Caption="Mã số thuế" VisibleIndex="3">
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="GhiChu" Caption="Ghi chú" VisibleIndex="11">
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="TongCongNo" Caption="Tổng công nợ" VisibleIndex="8">
                                            <PropertiesTextEdit DisplayFormatString="N0">
                                            </PropertiesTextEdit>
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="DaThanhToan" Caption="Đã thanh toán" VisibleIndex="9">
                                            <PropertiesTextEdit DisplayFormatString="N0">
                                            </PropertiesTextEdit>
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="TienTTConLai" Caption="Công nợ hiện tại" VisibleIndex="10">
                                            <PropertiesTextEdit DisplayFormatString="N0">
                                            </PropertiesTextEdit>
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Thời gian thanh toán" FieldName="ThoiHanThanhToan" ShowInCustomizationForm="True" VisibleIndex="7">
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Hạn mức công nợ" FieldName="HanMucCongNo" ShowInCustomizationForm="True" VisibleIndex="6">
                                            <Settings AllowHeaderFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nhân viên phục trách" FieldName="HoTenNV" ShowInCustomizationForm="True" VisibleIndex="12">
                                            <SettingsHeaderFilter Mode="CheckedList">
                                            </SettingsHeaderFilter>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nhóm" FieldName="TenLoaiKhachHang" ShowInCustomizationForm="True" VisibleIndex="13">
                                            <SettingsHeaderFilter Mode="CheckedList">
                                            </SettingsHeaderFilter>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="TongCongNo" ShowInColumn="Tổng công nợ" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="DaThanhToan" ShowInColumn="Đã thanh toán" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="TienTTConLai" ShowInColumn="Công nợ hiện tại" SummaryType="Sum" />
                                    </TotalSummary>
                                    <Styles>
                                        <Header Wrap="True">
                                        </Header>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="dsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:KobePaintConnectionString %>" SelectCommand="SELECT khKhachHang.IDKhachHang, khKhachHang.HoTen, khKhachHang.DiaChi, khKhachHang.MaKhachHang, khKhachHang.DienThoai, khKhachHang.MaSoThue, khKhachHang.GhiChu, khKhachHang.TongCongNo, khKhachHang.DaThanhToan, khKhachHang.TienTTConLai, nvNhanVien.HoTen AS HoTenNV, khLoaiKhachHang.TenLoaiKhachHang, khKhachHang.HanMucCongNo, khKhachHang.ThoiHanThanhToan FROM khKhachHang INNER JOIN khLoaiKhachHang ON khKhachHang.LoaiKhachHangID = khLoaiKhachHang.IDLoaiKhachHang INNER JOIN nvNhanVien ON khKhachHang.NhanVienPhuTrachID = nvNhanVien.IDNhanVien WHERE (khKhachHang.LoaiKhachHangID &lt;&gt; 1)"></asp:SqlDataSource>
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

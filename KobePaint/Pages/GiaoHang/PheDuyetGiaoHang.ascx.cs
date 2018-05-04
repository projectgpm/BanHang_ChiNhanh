﻿using DevExpress.Web;
using KobePaint.App_Code;
using KobePaint.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KobePaint.Pages.GiaoHang
{
    public partial class PheDuyetGiaoHang : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void gridChiTietHang_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["PhieuGiaoHangID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void gridChiTietHang_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexColumn(e);
        }

        protected void gridDonHang_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            Formats.InitDisplayIndexColumn(e);
        }

        protected void gridDonHang_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            using (var scope = new TransactionScope())
            {
                try
                {
                    if (e.NewValues["TrangThai"] == "0") return;
                    int IDPhieuGiaoHang = int.Parse(e.Keys["IDPhieuGiaoHang"].ToString());
                    int IDKhachHang = int.Parse(gridDonHang.GetRowValuesByKeyValue(e.Keys["IDPhieuGiaoHang"], "KhachHangID").ToString());
                    int pheduyet = Int32.Parse(e.NewValues["TrangThai"].ToString());

                    var KH = DBDataProvider.DB.khKhachHangs.Where(x => x.IDKhachHang == IDKhachHang).FirstOrDefault();
                    var PhieuGH = DBDataProvider.DB.ghPhieuGiaoHangs.Where(x => x.IDPhieuGiaoHang == IDPhieuGiaoHang).FirstOrDefault();
                    if (pheduyet == 1)
                    {
                        // duyệt đơn hàng
                        if (KH != null && PhieuGH != null)
                        {
                            #region nhật ký công nợ
                                khNhatKyCongNo nhatky = new khNhatKyCongNo();
                                nhatky.NgayNhap = DateTime.Now;
                                nhatky.DienGiai = "Duyệt giao hàng đại lý";
                                nhatky.NoDau = KH.CongNo;
                                nhatky.NhapHang = PhieuGH.ConLai;
                                nhatky.TraHang = 0;
                                nhatky.NoCuoi = KH.CongNo + PhieuGH.ConLai;
                                nhatky.ThanhToan = 0;
                                nhatky.NhanVienID = Formats.IDUser();
                                nhatky.SoPhieu = PhieuGH.MaPhieu;
                                nhatky.IDKhachHang = IDKhachHang;
                                DBDataProvider.DB.khNhatKyCongNos.InsertOnSubmit(nhatky);
                                DBDataProvider.DB.SubmitChanges();
                            #endregion
                            KH.CongNo += PhieuGH.ConLai; // cộng công nợ
                            KH.TongTienHang += PhieuGH.ConLai;
                            KH.LanCuoiMuaHang = DateTime.Now;
                            PhieuGH.TrangThai = 1;// duyệt thành công
                            PhieuGH.SoDonHangTrongNam = DBDataProvider.SoDonHangTrongNam_GiaoHang();
                            PhieuGH.STTDonHang = DBDataProvider.STTPhieuGiaoHang_DaiLy(IDKhachHang);
                            PhieuGH.CongNoHienTai = KH.CongNo;
                        }
                    }
                    else
                    {
                        // hủy đơn hàng
                        if (KH != null && PhieuGH != null)
                        {
                            // cộng tồn kho
                            var PhieuGiaoHangCT = DBDataProvider.DB.ghPhieuGiaoHangChiTiets.Where(x => x.PhieuGiaoHangID == IDPhieuGiaoHang).ToList();
                            foreach (var prod in PhieuGiaoHangCT)
                            {
                                var HH = DBDataProvider.DB.hhHangHoas.Where(x => x.IDHangHoa == prod.HangHoaID).FirstOrDefault();
                                HH.TonKho += prod.SoLuong;
                            }
                            PhieuGH.TrangThai = 2;// hủy đơn hàng
                            PhieuGH.STTDonHang = 0;
                            PhieuGH.SoDonHangTrongNam = 0;
                            PhieuGH.CongNoHienTai = KH.CongNo;
                        }
                    }

                    DBDataProvider.DB.SubmitChanges();
                    scope.Complete();
                    gridDonHang.CancelEdit();
                    e.Cancel = true;
                    //gridDonHang.DataBind();
                    //cbpInfoImport.JSProperties["cp_Reset"] = true;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }   
        }
    }
}
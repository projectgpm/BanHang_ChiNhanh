using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KobePaint.App_Code
{
    public static class DBDataProvider
    {
        const string DataContextKey = "DbGPMBDataContext";

        public static KobePaintDBDataContext DB
        {
            get
            {
                if (HttpContext.Current.Items[DataContextKey] == null)
                    HttpContext.Current.Items[DataContextKey] = new KobePaintDBDataContext();
                return (KobePaintDBDataContext)HttpContext.Current.Items[DataContextKey];
            }
        }

        public static string[] ArrInfo()
        {
            return HttpContext.Current.User.Identity.Name.Split('-');
        }

        //danh sách barcode 
        public static List<hhBarcode> GetDanhSach(int IDHangHoa)
        {
            return DB.hhBarcodes.Where(x => x.IDHangHoa == IDHangHoa).ToList();
        }
        // danh sách nhập kho chi tiết
        public static List<kNhapKhoChiTiet> NhapKhoChiTiet(int NhapKhoID)
        {
            return DB.kNhapKhoChiTiets.Where(x => x.NhapKhoID == NhapKhoID).ToList();
        }
        // danh sách phiếu xuất khác chi tiết
        public static List<kPhieuXuatKhacChiTiet> XuatKhacKhoChiTiet(int PhieuXuatID)
        {
            return DB.kPhieuXuatKhacChiTiets.Where(x => x.PhieuXuatID == PhieuXuatID).ToList();
        }

        // danh sách phiếu giao hàng chưa thanh toán & đã được duyệt
        public static List<ghPhieuGiaoHang> ListPhieuGiaoHang(int IDKhachHang)
        {
            return DB.ghPhieuGiaoHangs.Where(x => x.KhachHangID == IDKhachHang && x.TrangThai == 1 && x.TTThanhToan == 0).OrderByDescending(x => x.IDPhieuGiaoHang).ToList();
        }
        // danh sách phiếu giao hàng chưa thanh toán & đã được duyệt  asc
        public static List<ghPhieuGiaoHang> ListPhieuGiaoHang_ASC(int IDKhachHang)
        {
            return DB.ghPhieuGiaoHangs.Where(x => x.KhachHangID == IDKhachHang && x.TrangThai == 1 && x.TTThanhToan == 0).OrderBy(x => x.IDPhieuGiaoHang).ToList();
        }
        // danh sách phiếu nhập hàng chưa thanh toán
        public static List<kNhapKho> ListPhieuNhapHang(int IDKhachHang)
        {
            return DB.kNhapKhos.Where(x => x.NCCID == IDKhachHang && x.TTThanhToan == 0 && x.CongNo > 0).OrderByDescending(x => x.IDNhapKho).ToList();
        }
        // danh sách phiếu nhập hàng chưa thanh toán ASC
        public static List<kNhapKho> ListPhieuNhapHang_ASC(int IDKhachHang)
        {
            return DB.kNhapKhos.Where(x => x.NCCID == IDKhachHang && x.TTThanhToan == 0 && x.CongNo > 0).OrderBy(x => x.IDNhapKho).ToList();
        }
        // danh sách phiếu nhập hàng chưa thanh toán
        public static List<kNhapKho> ListPhieuNhapHang_TraHang(int IDKhachHang)
        {
            return DB.kNhapKhos.Where(x => x.NCCID == IDKhachHang).OrderByDescending(x => x.IDNhapKho).ToList();
        }
        // danh sách nhập kho chi tiết
        public static List<kNhapKhoChiTiet> ListChiTietNhapKho(int NhapKhoID)
        {
            return DB.kNhapKhoChiTiets.Where(x => x.NhapKhoID == NhapKhoID).ToList();
        }
        // danh sách phiếu giao hàng
        public static List<ghPhieuGiaoHang> ListPhieuGiaoHang_TraHang(int IDDaiLy)
        {
            return DB.ghPhieuGiaoHangs.Where(x => x.KhachHangID == IDDaiLy).OrderByDescending(x => x.IDPhieuGiaoHang).ToList();
        }
        // danh sách giao hàng chi tiết
        public static List<ghPhieuGiaoHangChiTiet> ListChiTietGiaoHang(int PhieuGiaoHangID)
        {
            return DB.ghPhieuGiaoHangChiTiets.Where(x => x.PhieuGiaoHangID == PhieuGiaoHangID).ToList();
        }

        //STT thanh toán NCC
        public static int STTPhieuThanhToan_NCC(int IDNCC)
        {
            return DB.kPhieuThanhToanNCCs.Where(x => x.KhachHangID == IDNCC && x.NgayThu.Value.Year == DateTime.Now.Year).Count() + 1;
        }
        //STT thanh toán đại lý
        public static int STTPhieuThanhToan_DaiLy(int IDDaiLy)
        {
            return DB.ghPhieuDaiLyThanhToans.Where(x => x.KhachHangID == IDDaiLy && x.NgayThu.Value.Year == DateTime.Now.Year).Count() + 1;
        }
        //STT phiếu giao hàng
        public static int STTPhieuGiaoHang_DaiLy(int IDDaiLy)
        {
            return DB.ghPhieuGiaoHangs.Where(x => x.KhachHangID == IDDaiLy).Count() + 1;
        }
        //Số đơn hàng trong năm phiếu giao hàng
        public static int SoDonHangTrongNam_GiaoHang()
        {
            return DB.ghPhieuGiaoHangs.Where(x => x.NgayTao.Value.Year == DateTime.Now.Year).Count() + 1;
        }




        #region report view
        public static ghPhieuGiaoHang GetPhieuGiaoHang(int ID)
        {
            return DB.ghPhieuGiaoHangs.Where(x => x.IDPhieuGiaoHang == ID).FirstOrDefault();
        }
        #endregion
    }
}
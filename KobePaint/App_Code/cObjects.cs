using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KobePaint.App_Code
{
    #region Nhập hàng
    [Serializable]


    public class oImportProduct_ChiTietNhapHang
    {
        public int STT { get; set; }
        public int IDHangHoa { get; set; }
        public string MaHang { get; set; }
        public string TenHangHoa { get; set; }
        public double GiaVon { get; set; }
        public int TonKho { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien { get; set; }
        public double GiaBanMoi { get; set; }
        public double GiaBanCu { get; set; }
        public oImportProduct_ChiTietNhapHang(int iDHangHoa, string maHang, string tenHangHoa, double giaVon, int tonKho, int soLuong, double thanhTien, double giaBanMoi, double giaBanCu)
        {
            // TODO: Complete member initialization
            this.IDHangHoa = iDHangHoa;
            this.MaHang = maHang;
            this.TenHangHoa = tenHangHoa;
            this.GiaVon = giaVon;
            this.TonKho = tonKho;
            this.SoLuong = soLuong;
            this.ThanhTien = thanhTien;
            this.GiaBanMoi = giaBanMoi;
            this.GiaBanCu = giaBanCu;
        }
    }
    #endregion

    #region Xuất khác
    [Serializable]
    public class oImportProduct_ChiTietXuatKhac
    {
        public int STT { get; set; }
        public int IDHangHoa { get; set; }
        public string MaHang { get; set; }
        public string TenHangHoa { get; set; }
        public double GiaVon { get; set; }
        public int TonKho { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien { get; set; }
        public int LyDoXuatID { get; set; }

        public oImportProduct_ChiTietXuatKhac(int iDHangHoa, string maHang, string tenHangHoa, double giaVon, int tonKho, int soLuong, double thanhTien, int lyDoXuatID)
        {
            // TODO: Complete member initialization
            this.IDHangHoa = iDHangHoa;
            this.MaHang = maHang;
            this.TenHangHoa = tenHangHoa;
            this.GiaVon = giaVon;
            this.TonKho = tonKho;
            this.SoLuong = soLuong;
            this.ThanhTien = thanhTien;
            this.LyDoXuatID = lyDoXuatID;
        }
    }
    #endregion


    #region Kiểm kê
    [Serializable]
    public class oImportProduct_ChiTietKiemKe
    {
        public int STT { get; set; }
        public int IDHangHoa { get; set; }
        public string MaHang { get; set; }
        public string TenHangHoa { get; set; }
        public int TonKhoHeThong { get; set; }
        public int TonKhoThucTe { get; set; }
        public int ChenhLech { get; set; }
        public int TrangThai { get; set; }
        public string DienGiai { get; set; }

        public oImportProduct_ChiTietKiemKe(int iDHangHoa, string maHang, string tenHangHoa, int tonKhoHeThong, int tonKhoThucTe, int chenhLech, int trangThai, string dienGiai)
        {
            // TODO: Complete member initialization
            this.IDHangHoa = iDHangHoa;
            this.MaHang = maHang;
            this.TenHangHoa = tenHangHoa;
            this.TonKhoHeThong = tonKhoHeThong;
            this.TonKhoThucTe = tonKhoThucTe;
            this.ChenhLech = chenhLech;
            this.TrangThai = trangThai;
            this.DienGiai = dienGiai;
        }
    }
    #endregion

    #region Lập phiếu giao hàng
    [Serializable]
    public class LapPhieuGiaohang
    {
        public int STT { get; set; }
        public int IDHangHoa { get; set; }
        public string MaHang { get; set; }
        public string TenHangHoa { get; set; }
        public double GiaVon { get; set; }
        public int TonKho { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien { get; set; }
        public double GiaBan { get; set; }
        public LapPhieuGiaohang(int iDHangHoa, string maHang, string tenHangHoa, double giaVon, int tonKho, int soLuong, double thanhTien, double giaBan)
        {
            // TODO: Complete member initialization
            this.IDHangHoa = iDHangHoa;
            this.MaHang = maHang;
            this.TenHangHoa = tenHangHoa;
            this.GiaVon = giaVon;
            this.TonKho = tonKho;
            this.SoLuong = soLuong;
            this.ThanhTien = thanhTien;
            this.GiaBan = giaBan;
        }
    }
    #endregion



    #region Trả hàng NCC
    [Serializable]
    public class oImportProduct_TraHangNCC
    {
        public int STT { get; set; }
        public int IDHangHoa { get; set; }
        public string MaHang { get; set; }
        public string TenHangHoa { get; set; }
        public double GiaVon { get; set; }
        public int TonKho { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien { get; set; }
        public double TienTra { get; set; }
        public oImportProduct_TraHangNCC(int iDHangHoa, string maHang, string tenHangHoa, double giaVon, int tonKho, int soLuong, double thanhTien,double tienTra)
        {
            // TODO: Complete member initialization
            this.IDHangHoa = iDHangHoa;
            this.MaHang = maHang;
            this.TenHangHoa = tenHangHoa;
            this.GiaVon = giaVon;
            this.TonKho = tonKho;
            this.SoLuong = soLuong;
            this.ThanhTien = thanhTien;
            this.TienTra = tienTra;
        }
    }
    #endregion


    #region report giao hàng
    [Serializable]
    public class oReportGiaoHang
    {
        public int IDPhieuGiaoHang { get; set; }
        public string NgayTao { get; set; }
        public string MaPhieu { get; set; }
        public int NhanVienID { get; set; }
        public string GhiChuGiaoHang { get; set; }
        public int KhachHangID { get; set; }
        public string NgayGiao { get; set; }
        public string NguoiGiao { get; set; }
        public string DiaChiGiaoHang { get; set; }
        public int TongSoLuong { get; set; }
        public double TongTien { get; set; }
        public string DienThoai { get; set; }
        public string SoHoaDon { get; set; }
        public double ThanhToan { get; set; }
        public double ConLai { get; set; }
        public string MaKhachHang { get; set; }
        public string TenKhachHang { get; set; }
        public string TenNhanVien { get; set; }
        public string SoDonHangTrongNam { get; set; }
        public double CongNoHienTai { get; set; }
        public string TieuDePhieu { get; set; }
        public List<oProduct> listProduct { get; set; }
    }
    [Serializable]
    public class oProduct
    {
        public int STT { get; set; }
        public string MaHang { get; set; }
        public string TenHang { get; set; }
        public string TenDonViTinh { get; set; }
        public int SoLuong { get; set; }
        public double DonGia { get; set; }
        public double ThanhTien { get; set; }


        public oProduct(string maHang,string tenHang,string tenDonViTinh,int soLuong, float donGia)
        {
            // TODO: Complete member initialization
            this.MaHang = maHang;
            this.TenHang = tenHang;
            this.TenDonViTinh = tenDonViTinh;
            this.SoLuong = soLuong;
            this.DonGia = donGia;
            this.ThanhTien = this.SoLuong * this.DonGia;
        }

        public oProduct()
        {
            // TODO: Complete member initialization
        }

        public oProduct(oProduct x)
        {
            // TODO: Complete member initialization
            this.STT = x.STT;
            this.MaHang = x.MaHang;
            this.TenHang = x.TenHang;
            this.TenDonViTinh = x.TenDonViTinh;
            this.SoLuong = SoLuong;
            this.DonGia = DonGia;
            this.ThanhTien = ThanhTien;
        }
       
    }

    #endregion
}
 
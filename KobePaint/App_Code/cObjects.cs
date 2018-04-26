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
        public oImportProduct_ChiTietNhapHang(int iDHangHoa, string maHang, string tenHangHoa, double giaVon, int tonKho, int soLuong, double thanhTien,double giaBanMoi, double giaBanCu)
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

    //[Serializable]
    //public class oDeliveryNote
    //{
    //    public int ID { get; set; }
    //    public string ReceiptNum { get; set; }
    //    public DateTime OrderDate { get; set; }
    //    public DateTime DispatchDate { get; set; }
    //    public int LicensePlate { get; set; }
    //    public int Driver { get; set; }
    //    public string AdditionInfo { get; set; }
    //    public List<oProduct> listProduct { get; set; }

    //    public string CustomerCode { get; set; }
    //    public string SerialOrder { get; set; }
    //    public string NumOrder { get; set; }
    //    public string strDispatchDate { get; set; }
    //    public float TotalOrder { get; set; }
    //    public float OldDebt { get; set; }
    //    public string CustomerName { get; set; }
    //    public string CustomerPhone { get; set; }
    //    public string CustomerAddress { get; set; }
    //}
    //[Serializable]
    //public class oProduct
    //{        
    //    public oProduct(int productID, string productName, string productNum, int colorID, string color, string measure, string unit, float price, float discount)
    //    {
    //        // TODO: Complete member initialization
    //        this.ProductID = productID;
    //        this.ProductName = productName;
    //        this.ProductNum = productNum;
    //        this.ColorID = colorID;
    //        this.Color = color;
    //        this.Measure = measure;
    //        this.Unit = int.Parse(unit);
    //        this.Price = price;
    //        this.Discount = discount;
    //        this.Total = this.Unit * this.Price;
    //    }

    //    public oProduct()
    //    {
    //        // TODO: Complete member initialization
    //    }

    //    public oProduct(oProduct x)
    //    {
    //        // TODO: Complete member initialization
    //        this.STT = x.STT;
    //        this.ProductID = x.ProductID;
    //        this.ProductName = x.ProductName;
    //        this.ProductNum = x.ProductNum;
    //        this.ColorID = x.ColorID;
    //        this.Color = x.Color;
    //        this.Measure = x.Measure;
    //        this.Unit = x.Unit;
    //        this.Price = x.Price;
    //        this.Discount = x.Discount;
    //        this.Total = x.Total;
    //        this.IDOrderNode = x.IDOrderNode;
    //    }
    //    public int STT { get; set; }
    //    public int ProductID { get; set; }
    //    public string ProductName { get; set; }
    //    public string ProductNum { get; set; }
    //    public int ColorID { get; set; }
    //    public string Color { get; set; }
    //    public string Measure { get; set; }
    //    public int Unit { get; set; }
    //    public float Price { get; set; }
    //    public float Discount { get; set; }
    //    public float Total { get; set; }
    //    public int IDOrderNode { get; set; }
    //    public int OriginalUnit { get; set; }
    //}
   
    //[Serializable]
    //public class oReturnNode
    //{
    //    public int ID { get; set; }
    //    public int IDCustomer { get; set; }
    //    public DateTime DateReturns { get; set; }
    //    public DateTime DateStorage { get; set; }
    //    public string AdditionInfo { get; set; }
    //    public List<oProduct> ListHangTra { get; set; }

    //    public string SerialReturn { get; set; }
    //    public string NumReturns { get; set; }
    //    public string strReturnDate { get; set; }
    //    public string strStorageDate { get; set; }
    //    public float ToTal { get; set; }
    //    public string CustomerName { get; set; }
    //    public string CustomerPhone { get; set; }
    //    public string CustomerAddress { get; set; }
    //    public string CustomerCode { get; set; }
    //}
    //public class oPayNode
    //{
    //    public float DebtBefore { get; set; }
    //    public float Payment { get; set; }
    //    public float DebtAfter { get; set; }
    //    public string AdditionInfo { get; set; }
    //    public string SerialPay { get; set; }
    //    public string NumInvoice { get; set; }
    //    public string NumPay { get; set; }
    //    public string PayDate { get; set; }
    //    public int IDCustomer { get; set; }
    //}
    //public class oPayNodeDiscount
    //{
    //    public float DebtBefore { get; set; }
    //    public float Payment { get; set; }
    //    public float DebtAfter { get; set; }
    //    public float TotalDiscount { get; set; }
    //    public float Imprested { get; set; }
    //    public float DiscountPaid { get; set; }
    //    public float Discount { get; set; }
    //    public string iType { get; set; }
    //    public string iDate { get; set; }
    //    public string title { get; set; }
    //    public string CustomerName { get; set; }
    //    public string CustomerPhone { get; set; }
    //    public int CustomerID { get; set; }
    //    public string CustomerCode { get; set; }

    //}
    //public class oImprestNode
    //{
    //    public string Staff { get; set; }
    //    public string CustomerName { get; set; }
    //    public string CustomerPhone { get; set; }
    //    public string iType { get; set; }
    //    public float iMoney { get; set; }
    //    public string iDate { get; set; }
    //    public string title { get; set; }
    //}
}
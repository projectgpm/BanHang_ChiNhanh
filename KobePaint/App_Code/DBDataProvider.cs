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
    }
}
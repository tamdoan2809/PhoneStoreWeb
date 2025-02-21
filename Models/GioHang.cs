using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebGURDIAN.Models;

namespace WebGURDIAN.Models
{
    public class GioHang
    {
        DbQLMPDataContext db = new DbQLMPDataContext();
        public int iMaSP { set; get; }
        public string sTenSP { set; get; }
        public string Hinh { set; get; }
        public int iSoLuong { set; get; }
        public double dDonGia { set; get; }
        public double dThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }
        public GioHang(int maSP)
        {
            iMaSP = maSP;
            SANPHAM sp = db.SANPHAMs.Single(s => s.MASP == iMaSP);
            sTenSP = sp.TENSP;
            Hinh = sp.HINH;
            dDonGia = double.Parse(sp.GIA.ToString());
            iSoLuong = 1;
        }
    }
}
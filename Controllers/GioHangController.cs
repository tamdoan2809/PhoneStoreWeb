using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGURDIAN.Models;

namespace WebGURDIAN.Controllers
{
    public class GioHangController : Controller
    {
        //
        // GET: /GioHang/
        DbQLMPDataContext db = new DbQLMPDataContext();
        public List<GioHang> LayGioHang()
        {
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang == null)
            {
                listGioHang = new List<GioHang>();
                Session["GioHang"] = listGioHang;
            }
            return listGioHang;
        }
        private int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                tsl += listGioHang.Sum(sp => sp.iSoLuong);
            }
            return tsl;
        }
        private double TongThanhTien()
        {
            double ttt = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                ttt += listGioHang.Sum(sp => sp.dThanhTien);
            }
            return ttt;
        }
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> listGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();
            return View(listGioHang);
        }
        public ActionResult ThemGioHang(int msp, string strURL)
        {
            List<GioHang> listGioHang = LayGioHang();
            GioHang SanPham = listGioHang.Find(sp => sp.iMaSP == msp);
            if (SanPham == null)
            {
                SanPham = new GioHang(msp);
                listGioHang.Add(SanPham);
                return Redirect(strURL);
            }
            else
            {
                SanPham.iSoLuong++;
                return Redirect(strURL);
            }
        }
        public ActionResult XoaGioHang(int MaSP)
        {
            List<GioHang> listGioHang = LayGioHang();
            GioHang sp = listGioHang.Single(s => s.iMaSP == MaSP);
            if (sp != null)
            {
                listGioHang.RemoveAll(s => s.iMaSP == MaSP);
                return RedirectToAction("GioHang", "GioHang");
            }
            if (listGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("GioHang", "GioHang");
        }
        public ActionResult CapNhatGioHang(int MaSP, int SoLuong)
        {
            List<GioHang> listGioHang = LayGioHang();
            GioHang sp = listGioHang.Single(s => s.iMaSP == MaSP);
            if (sp != null)
            {
                sp.iSoLuong = SoLuong;
            }
            return RedirectToAction("GioHang", "GioHang");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["taikhoan"] == null)
            {
                return RedirectToAction("DangNhap", "User");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("SanPhamAll", "SanPham");
            }
            List<GioHang> listGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();

            return View(listGioHang);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection f)
        {
            // Tạo hóa đơn mới
            HOADON hd = new HOADON();
            GIAMGIA gg = new GIAMGIA();
            NGUOIDUNG nd = (NGUOIDUNG)Session["taikhoan"];
            List<GioHang> gh = LayGioHang();
            hd.MAND = nd.MAND;
            hd.NGUOILAP = "Hệ thống";
            hd.TENHD = "Hóa đơn bán hàng";
            hd.NGAYLAP = DateTime.Now;
            hd.TRANGTHAI = "Chưa thanh toán";
            double tongTienDouble = TongThanhTien();
            decimal tongTienDecimal = (decimal)tongTienDouble;
            hd.TONGTIEN = tongTienDecimal;
            hd.MAGG = 1;
            db.HOADONs.InsertOnSubmit(hd);
            db.SubmitChanges();

            foreach (var item in gh)
            {
                CHITIETHOADON cthd = new CHITIETHOADON();
                cthd.MAHD = hd.MAHD;
                cthd.MASP = item.iMaSP;
                cthd.SOLUONG = item.iSoLuong;
                cthd.DONGIA = (decimal)item.dDonGia;
                cthd.THANHTIEN = (decimal)item.dThanhTien;
                db.CHITIETHOADONs.InsertOnSubmit(cthd);
            }
            db.SubmitChanges();
            Session["GioHang"] = null;
            Session["MaHoaDon"] = hd.MAHD;

            string paymentMethod = f["paymentMethod"];
            if (paymentMethod == "TrucTuyen")
            {
                return RedirectToAction("ThanhToanTrucTuyen", "GioHang");
            }
            else
            {
                return RedirectToAction("ThanhToanSau", "GioHang");
            }
        }
        public ActionResult ThanhToanTrucTuyen()
        {
            return View();
        }
        public ActionResult ThanhToanSau()
        {
            int maHoaDon = (int)Session["MaHoaDon"];

            var hoaDon = db.HOADONs.SingleOrDefault(hd => hd.MAHD == maHoaDon);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            var nguoiDung = db.NGUOIDUNGs.SingleOrDefault(nd => nd.MAND == hoaDon.MAND);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }

            var model = new ThanhToanSauViewModel
            {
                MaHoaDon = hoaDon.MAHD,
                TongTien = hoaDon.TONGTIEN ?? 0,
                HoTen = nguoiDung.HOTEN,
                DiaChi = nguoiDung.DIACHI,
                SDT = nguoiDung.SDT
            };

            return View(model);
        }

        public ActionResult XacNhanDonHang()
        {
            return View();
        }
	}
}
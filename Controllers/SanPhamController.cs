using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGURDIAN.Models;

namespace WebGURDIAN.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /SanPham/
        DbQLMPDataContext db = new DbQLMPDataContext();
        public ActionResult SanPhamAll()
        {
            var ListSP = db.SANPHAMs.ToList();
            return View(ListSP);
        }
        public ActionResult XemChiTiet(int msp)
        {
            SANPHAM sp = db.SANPHAMs.Single(s => s.MASP == msp);
            if (sp == null)
            {
                return HttpNotFound();
            }
            return View(sp);
        }
        public ActionResult LoaiPartial()
        {

            var ListLoai = db.DANHMUCSPs.ToList();
            return PartialView(ListLoai);
        }
        public ActionResult SPTheoLoai(int maLoai)
        {
            var listSPTL = db.SANPHAMs.Where(s => s.MADM == maLoai).ToList();
            DANHMUCSP danhmuc = db.DANHMUCSPs.Single(x => x.MADM == maLoai);
            ViewBag.TENDM = danhmuc.TENDM;
            return View(listSPTL);
        }
        public ActionResult TimSanPham(string txt_Search)
        {
            var ListSP = db.SANPHAMs.Where(s => s.TENSP.Contains(txt_Search)).ToList();
            return View(ListSP);
        }
        [HttpGet]
        public ActionResult ThemSanPham()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ThemSanPham(SANPHAM sanPham)
        {
            if (ModelState.IsValid)
            {
                db.SANPHAMs.InsertOnSubmit(sanPham);
                db.SubmitChanges();
                ViewBag.SuccessMessage = "Thêm sản phẩm thành công!";
                return RedirectToAction("SanPhamAll", "SanPham");
            }
            return View("ThemSanPham", "SanPham");
        }
        [HttpPost]
        public ActionResult XoaSanPham(int id)
        {

            SANPHAM sanPham = db.SANPHAMs.SingleOrDefault(sp => sp.MASP == id);
            if (sanPham != null)
            {
                db.SANPHAMs.DeleteOnSubmit(sanPham);
                db.SubmitChanges();
                ViewBag.SuccessMessage = "Xóa sản phẩm thành công!";
            }
            return RedirectToAction("SanPhamAll", "SanPham");
        }
        [HttpGet]
        public ActionResult CapNhatSanPham(int id)
        {
            SANPHAM sanPham = db.SANPHAMs.SingleOrDefault(sp => sp.MASP == id);
            if (sanPham != null)
            {
                return View(sanPham);
            }
            return HttpNotFound();
        }

        [HttpPost]
        public ActionResult CapNhatSanPham(SANPHAM sanPham)
        {
            if (ModelState.IsValid)
            {
                SANPHAM sp = db.SANPHAMs.SingleOrDefault(s => s.MASP == sanPham.MASP);
                if (sp != null)
                {
                    sp.TENSP = sanPham.TENSP;
                    sp.MADM = sanPham.MADM;
                    sp.MOTA = sanPham.MOTA;
                    sp.XUATXU = sanPham.XUATXU;                                           
                    sp.THUONGHIEU = sanPham.THUONGHIEU;
                    sp.GIA = sanPham.GIA;
                    sp.SOLUONG = sanPham.SOLUONG;
                    sp.HSD = sanPham.HSD;
                    sp.HINH = sanPham.HINH;
                    db.SubmitChanges();
                    return RedirectToAction("SanPhamAll", "SanPham");
                }
            }
            return View(sanPham);
        }
	}
}
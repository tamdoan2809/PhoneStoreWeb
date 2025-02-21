using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebGURDIAN.Models;

namespace WebGURDIAN.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        DbQLMPDataContext db = new DbQLMPDataContext();
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(NGUOIDUNG nd, FormCollection f)
        {
            var hoten = f["HoTenND"];
            var tendn = f["TenDN"];
            var matkhau = f["MatKhau"];
            var rematkhau = f["Rematkhau"];
            var dienthoai = f["DienThoai"];
            var ngaysinh = f["NgaySinh"];
            var diachi = f["DiaChi"];
            var email = f["Email"];
            var gioitinh = f["GioiTinh"];

            // Xóa thông báo lỗi cũ
            ViewData.Clear();

            bool hasError = false;

            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên không được bỏ trống";
                hasError = true;
            }
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Tên đăng nhập không được bỏ trống";
                hasError = true;
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Mật khẩu không được bỏ trống";
                hasError = true;
            }
            if (String.IsNullOrEmpty(rematkhau))
            {
                ViewData["Loi4"] = "Xác nhận mật khẩu không được bỏ trống";
                hasError = true;
            }
            if (matkhau != rematkhau)
            {
                ViewData["Loi4"] = "Xác nhận mật khẩu không khớp với mật khẩu";
                hasError = true;
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi5"] = "Số điện thoại không được bỏ trống";
                hasError = true;
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi6"] = "Email không được bỏ trống";
                hasError = true;
            }
            if (String.IsNullOrEmpty(gioitinh))
            {
                ViewData["Loi7"] = "Giới tính không được bỏ trống";
                hasError = true;
            }
            if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi8"] = "Địa chỉ không được bỏ trống";
                hasError = true;
            }

            if (!hasError)
            {
                // Kiểm tra trùng lặp tên đăng nhập
                var existingUser = db.NGUOIDUNGs.SingleOrDefault(c => c.TAIKHOAN == tendn);
                if (existingUser != null)
                {
                    ViewData["Loi2"] = "Tên đăng nhập đã tồn tại";
                    hasError = true;
                }

                // Kiểm tra trùng lặp email
                var existingEmail = db.NGUOIDUNGs.SingleOrDefault(c => c.EMAIL == email);
                if (existingEmail != null)
                {
                    ViewData["Loi6"] = "Email đã tồn tại";
                    hasError = true;
                }

                // Kiểm tra trùng lặp số điện thoại
                var existingPhone = db.NGUOIDUNGs.SingleOrDefault(c => c.SDT == dienthoai);
                if (existingPhone != null)
                {
                    ViewData["Loi5"] = "Số điện thoại đã tồn tại";
                    hasError = true;
                }

                if (!hasError)
                {
                    // Thiết lập thông tin người dùng mới
                    nd.HOTEN = hoten;
                    nd.TAIKHOAN = tendn;
                    nd.MATKHAU = matkhau;
                    nd.NGAYSINH = String.IsNullOrEmpty(ngaysinh) ? (DateTime?)null : DateTime.Parse(ngaysinh);
                    nd.DIACHI = diachi;
                    nd.EMAIL = email;
                    nd.SDT = dienthoai;
                    nd.THOIGIANTAO = DateTime.Now;

                    // Thêm người dùng mới vào cơ sở dữ liệu
                    db.NGUOIDUNGs.InsertOnSubmit(nd);
                    db.SubmitChanges();


                    int newUserId = nd.MAND;

                    QUYENND userPermission = new QUYENND
                    {
                        MAND = newUserId,
                        MAQUYEN = 3 // Mã quyền mặc định
                    };

                    // Thêm quyền vào cơ sở dữ liệu
                    db.QUYENNDs.InsertOnSubmit(userPermission);
                    db.SubmitChanges();

                    return RedirectToAction("DangNhap", "User");
                }
            }
            return View();
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            var tendn = f["TenDN"];
            var matkhau = f["MatKhau"];

            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Tên đăng nhập không được bỏ trống";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Mật khẩu không được bỏ trống";
            }

            if (!String.IsNullOrEmpty(tendn) && !String.IsNullOrEmpty(matkhau))
            {
                NGUOIDUNG nd = db.NGUOIDUNGs.SingleOrDefault(c => c.TAIKHOAN == tendn && c.MATKHAU == matkhau);
                if (nd != null)
                {
                    Session["UserName"] = nd.TAIKHOAN;
                    Session["UserId"] = nd.MAND;
                    ViewBag.TB = "Login Sucess !";
                    ViewBag.MessageType = "Success"; // Thông báo loại thành công
                    Session["taikhoan"] = nd;
                }
                else
                {
                    ViewBag.TB = "Sai tên đăng nhập hoặc mật khẩu, vui lòng nhập lại!";
                    ViewBag.MessageType = "Error"; // Thông báo loại thất bại
                }
            }
            return View();
        }
        public ActionResult ThongTinNguoiDung(int mnd)
        {
            NGUOIDUNG nd = db.NGUOIDUNGs.SingleOrDefault(s => s.MAND == mnd);
            if (nd == null)
            {
                return HttpNotFound();
            }
            return View(nd);
        }
        public ActionResult DangXuat()
        {
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("DangNhap", "User");
        }
        [HttpGet]
        public ActionResult CapNhatThongTin()
        {
            var userId = (int)Session["UserId"];
            NGUOIDUNG user = db.NGUOIDUNGs.SingleOrDefault(u => u.MAND == userId);

            if (user == null)
            {
                return HttpNotFound();
            }

            return View(user);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhatThongTin(NGUOIDUNG updatedUser)
        {
            if (ModelState.IsValid)
            {
                var userId = (int)Session["UserId"];
                NGUOIDUNG existingUser = db.NGUOIDUNGs.SingleOrDefault(u => u.MAND == userId);

                if (existingUser != null)
                {
                    bool hasError = false;

                    // Kiểm tra trùng lặp số điện thoại
                    var existingPhone = db.NGUOIDUNGs.SingleOrDefault(u => u.SDT == updatedUser.SDT && u.MAND != userId);
                    if (existingPhone != null)
                    {
                        ViewBag.Message = "Số điện thoại đã tồn tại!";
                        ViewBag.MessageType = "Error";
                        hasError = true;
                    }

                    // Kiểm tra trùng lặp email
                    var existingEmail = db.NGUOIDUNGs.SingleOrDefault(u => u.EMAIL == updatedUser.EMAIL && u.MAND != userId);
                    if (existingEmail != null)
                    {
                        ViewBag.Message = "Email đã tồn tại!";
                        ViewBag.MessageType = "Error";
                        hasError = true;
                    }
                    if (!hasError)
                    {
                        existingUser.HOTEN = updatedUser.HOTEN;
                        existingUser.NGAYSINH = updatedUser.NGAYSINH;
                        existingUser.DIACHI = updatedUser.DIACHI;
                        existingUser.SDT = updatedUser.SDT;
                        existingUser.EMAIL = updatedUser.EMAIL;
                        existingUser.GIOITINH = updatedUser.GIOITINH;
                        existingUser.THOIGIANTAO = existingUser.THOIGIANTAO; 
                        db.SubmitChanges();
                        ViewBag.Message = "Cập nhật thông tin thành công!";
                        ViewBag.MessageType = "Success";
                    }
                }
                else
                {
                    ViewBag.Message = "Lỗi !";
                    ViewBag.MessageType = "Error";
                }
            }
            return View(updatedUser);
        }
        [HttpGet]
        public ActionResult DoiMatKhau()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DoiMatKhau(string matKhauHienTai, string matKhauMoi, string nhapLaiMatKhauMoi)
        {
            var userId = (int)Session["UserId"];
            NGUOIDUNG existingUser = db.NGUOIDUNGs.SingleOrDefault(u => u.MAND == userId);

            if (existingUser == null)
            {
                ViewBag.Message = "Người dùng không tồn tại!";
                ViewBag.MessageType = "Error";
                return View();
            }

            if (string.IsNullOrEmpty(matKhauHienTai) || string.IsNullOrEmpty(matKhauMoi) || string.IsNullOrEmpty(nhapLaiMatKhauMoi))
            {
                ViewBag.Message = "Vui lòng nhập đầy đủ thông tin.";
                ViewBag.MessageType = "Error";
                return View();
            }

            if (existingUser.MATKHAU != matKhauHienTai)
            {
                ViewBag.Message = "Mật khẩu hiện tại không chính xác.";
                ViewBag.MessageType = "Error";
                return View();
            }

            if (matKhauMoi != nhapLaiMatKhauMoi)
            {
                ViewBag.Message = "Mật khẩu mới và xác nhận mật khẩu không khớp.";
                ViewBag.MessageType = "Error";
                return View();
            }

            // Cập nhật mật khẩu mới
            existingUser.MATKHAU = matKhauMoi;
            db.SubmitChanges();

            ViewBag.Message = "Đổi mật khẩu thành công!";
            ViewBag.MessageType = "Success";
            return View();
        }

	}
}
Create database QL_MyPham
go
use master
Drop database QL_MyPham
use QL_MyPham

CREATE TABLE DANHMUCSP
(
	MADM INT IDENTITY (1,1) PRIMARY KEY,
	TENDM NVARCHAR(50) NOT NULL UNIQUE 
);
--
INSERT INTO DANHMUCSP(TENDM)
VALUES 
(N'Độc quyền Guardian'),
(N'Chăm sóc da mặt'),
(N'Trang điểm'),
(N'Chăm sóc cơ thể'),
(N'Chăm sóc sức khỏe'),
(N'Chăm sóc cá nhân'),
(N'Chăm sóc tóc'),
(N'Mẹ và Bé')

SELECT * FROM DANHMUCSP

--

CREATE TABLE SANPHAM
(
	MASP INT IDENTITY (1,1) PRIMARY KEY,
	TENSP NVARCHAR(150) NOT NULL,
	MADM INT NOT NULL,
	MOTA NVARCHAR(500),
	XUATXU NVARCHAR(50) CHECK (LEN(XUATXU) > 0), -- Không để trống
	THUONGHIEU NVARCHAR(50) CHECK (LEN(THUONGHIEU) > 0), -- Không để trống
	GIA MONEY CHECK (GIA > 0), -- Ràng buộc giá trị dương
	SOLUONG INT CHECK (SOLUONG >= 0), -- Ràng buộc số lượng không âm
	HSD NVARCHAR(15),
	HINH CHAR(150) NOT NULL,
	CONSTRAINT FK_SANPHAM_MADM FOREIGN KEY (MADM) REFERENCES DANHMUCSP(MADM)
);
--
INSERT INTO SANPHAM(TENSP,MADM,MOTA,XUATXU,THUONGHIEU,GIA,SOLUONG,HSD,HINH)
VALUES 
(N'Bông Ráy Tai Túi Zip Giúp Làm Sạch Bụi Bẩn Guardian All-Purpose Cotton Tips 200 Cây',1,N'Bông Ráy Tai Túi Zip Giúp Làm Sạch Bụi Bẩn Guardian All-Purpose Cotton Tips với đầu bông mềm mại không gây đau rát, nhẹ nhàng lấy sạch bụi bẩn ở tai. Thiết kế gọn nhẹ, tiện dụng khi đi ra ngoài.',N'Malaysia',N'Guardian',22000,200,N'36 Tháng','673cd14eafec9819205a134a1ed1f74f9135d29e1805899f59600247ed01f204.jpg'),
(N'Dầu Gội 3 Trong 1 Guardian Hương Bạc Hà 350Ml',1,N'Dầu Gội 3 Trong 1 Guardian Hương Bạc Hà 350Ml với 3 loại protein ngũ cốc thủy phân và bạc hà tươi mát, sản phẩm dầu gội của Guardian giúp làm sạch bã nhờn và gàu, làm sạch sâu từ tận chân tóc. Công thức không chứa Parabens',N'Malyasia',N'Guardian',34000,200,N'36 Tháng','3025258_qoucb5zpjefpw6so.jpg'),
(N'Bộ Mỹ Phẩm Du Lịch Botaneco Garden Trio Oil 60Ml X 4 Sản Phẩm (Sữa Tắm x 2 + Dầu Gội + Dầu Xả)',1,N'Bộ mỹ phẩm du lịch Botaneco Garden Trio Oil có công thức từ các thành phần tự nhiên, kết hợp từ các tinh dầu: dầu cọ từ Mỹ Latinh, dầu baobab từ Châu Phi, dầu chufa từ Pháp, giúp nuôi dưỡng da và tóc khỏe đẹp. Thích hợp khi đi du lịch. Sản phẩm không thử nghiệm trên động vật. Sản phẩm không chứa parapen, silicon, xà phòng, chất tạo màu, lanolin & DEA.',N'Malaysia',N'BOTANECO',63000,200,N'36 Tháng','74b7dee1ba3ff9dc3e6795231753fbdfea84625f8a8a9479805bbd7a9849a304.png'),
(N'Tinh Chất Dưỡng Ẩm, Làm Dịu Da Bidalli Vegan Hyaluronic Pure Cica Serum Chiết Xuất Rau Má 50ml',1,N'Tinh chất dưỡng ẩm Bidalli Vegan Hyaluronic Pure Cica Serum với chiết xuất rau má, tảo Spirulina và các thành phần tự nhiên, cung cấp độ ẩm và làm dịu da',N'Korea',N'BIDALLI',149000,200,N'36 Tháng','3027860_urcr0w3lvu0khkvr.jpg'),
(N'Khăn Giấy Gói Lẻ Siêu Mềm Guardian Ultra Soft Mini Tissues Không Mùi 10 Tờ',1,N'Khăn Giấy Gói Lẻ Siêu Mềm Guardian Ultra Soft Mini Tissues Không Mùi',N'Malaysia',N'Guardian',3000,200,N'36 Tháng','3027455_zm5kc9l2k6o5aqp3.jpg'),
(N'Mask Niacinamide Hydrate & Illuminate Giúp Cấp Ẩm Da 23Ml',1,N'Mặt nạ hỗ trợ sáng da Number Eight có công thức với Niacinamide, một thành phần giúp Hỗ Trợ Se Khít Lỗ Chân Lông, làm sáng và dưỡng ẩm cho da.',N'Korean',N'NUMBER EIGHT',19000,200,N'36 Tháng','3026219_ft_d6e4f16fcd074602a139c3b96d06c207_ezf2q84yh8jjikpx.jpg'),
(N'Nước Rửa Tay Kháng Khuẩn Guardian Antibacterial Handwash Maximum Protection Bảo Vệ Tối Ưu 250Ml',1,N'Được tạo ra với 8 thành phần được chọn lọc đặc biệt, công thức độc đáo của chúng tôi bảo vệ làn da của bạn khỏi vi khuẩn, khô ráp và các gốc tự do để mang lại làn da khỏe mạnh và mịn màng.',N'Malaysia',N'Guardian',18000,200,N'36 Tháng','3025812_ft_d708bb6847e6430ca36027a16b144570_y8mddoaqu5cj67ee.png'),
(N'Cây Nặn Mụn Đầu Đen Blackhead And Pimple Remover Guardian',1,N'Giúp lấy đi cồi mụn',N'Malaysia',N'Guardian',23000,200,N'36 Tháng','3024992_imxty2ft0o7h5str.jpg'),
(N'Mặt Nạ Và Tẩy Tế Bào Chết Tảo Biển Magnet Đào Thải Độc Tố Bổ Sung Độ Ẩm Dưỡng Trắng Và Làm Đều Màu Da 70Ml',1,N'Bổ sung độ ẩm cần thiết cho da chống lão hóa, ngăn ngừa sự sản sinh của các sắc tố melanin, hạn chế quá trình hình thành các vết nám, sạm, tàn nhang, dưỡng da trắng sáng và đều màu',N'Việt Nam',N'MAGNET',93000,200,N'36 Tháng','3028732_5.jpg'),
(N'Serum Lolane Dành Cho Tóc Khô & Hư Tổn Chai 50Ml',1,N'Serum dưỡng tóc chiết xuất từ Jojoba, Macadacia, và vitamin E giúp nuôi dưỡng mái tóc và các lớp men biểu bì cho những loại tóc khô, tóc hư tổn và tóc bị chẻ ngọn.',N'Thái Lan',N'LOLANE',79000,200,N'36 Tháng','1944c18efc1b1a81d73333fa88ddb7247a580b986b3dfe64110d936de3bde581.jpg')
--
INSERT INTO SANPHAM(TENSP,MADM,MOTA,XUATXU,THUONGHIEU,GIA,SOLUONG,HSD,HINH)
VALUES 
(N'Miếng Dán Mũi Lột Mụn Than Hoạt Tính Biore Hộp 4 Miếng',2,N'Lấy sạch mụn cám và mụn đầu đen ngay lập tức, đồng thời cho cảm giác mát lạnh sảng khoái với tinh chất bạc hà. Hoạt chất than hoạt tính giúp sạch nhờn gấp 3 lần (*), giúp se nhỏ lỗ chân lông, cho làn da thoáng mịn hơn chỉ sau 1-2 tuần sử dụng thường xuyên.',N'Nhật Bản',N'BIORE',22000,200,N'36 Tháng','dce2e7a74c9f07768ac5ad81ff99b8cdfb82829ff49f91944a42dc58c9c846ae.jpg'),
(N'Kem Chống Nắng Cho Da Nhạy Cảm Skin1004 Madagascar Centella Air-Fit Suncream Plus Spf50+ Pa++++ 50Ml',2,N'Kem chống nắng dành cho da nhạy cảm của Skin1004 chứa thành phần Truecica độc quyền, chứa nhiều thành phần thiên nhiên như ngải cứu, tràm trà và rau má. Cùng với chất kem không quá đặc sẽ rất dễ dàng thấm vào da. Không hề tạo hiệu ứng trắng bệch mất tự nhiên tẹo nào đâu nha. Với các cô gái yêu thích phong cách trang điểm nhẹ nhàng chắc chắn sẽ fall-in-love với em ấy ngay thôi. Bởi vì chỉ cần một lớp mỏng là tone da của bạn sẽ được cải thiện rõ rệt, mà lại không hề mất đi nét tự nhiên.',N'Korea',N'SKIN1004',259000,200,N'36 Tháng','3024648-1_84f7764edd3b4656ba4a578a88837bd9_qntqrlhrbs1vu7r8.jpg'),
(N'Mặt Nạ Ngăn ngừa Lão Hóa EAORON NMN Line Filler 25 ML',2,N'Mặt Nạ Ngăn ngừa Lão Hóa EAORON NMN Line Filler 25 ML dưỡng da giảm lão hóa và tăng độ đàn hồi cho da. Cảm nhận làn da căng mịn và tươi mát ngay lần sử dụng đầu tiên. Cung cấp độ ẩm giúp da luôn căng mịn và đầy sức sống. Cải thiện sắc tố da và dưỡng da giúp làm sáng, mịn màng. Làm dịu mát làn da.',N'Australia',N'EAORON',46000,200,N'36 Tháng','3029919_1_.png'),
(N'Kem Nghệ Collagen Thorakao 10Gr',2,N'Kem nghệ Collagen Thorakao 10Gr là một đột phá mới của THORAKAO. Với các dược liệu quý, THORAKAO đã tiến tới sự toàn hảo về khả năng ứng dụng các chế phẩm thiên nhiên trong việc chăm sóc da. Kem nghệ Collagen Thorakao với thành phần được chiết xuất từ củ nghệ thiên nhiên và các dưỡng chất, giúp hoàn thiện vẻ đẹp làn da bạn',N'Việt Nam',N'THORAKAO',99000,200,N'36 Tháng','de03a6acc534d145c29db561aac990f12fe089b3ceb9ebff9400e5e7ad911fe3.jpg'),
(N'Bông Tẩy Trang Jomi 120',2,N'Bông tẩy trang của thương hiệu Jomi là sản phẩm bông tẩy trang đến từ thương hiệu mỹ phẩm Jomi của Nhật Bản. Sản phẩm được làm từ vật liệu Polymer đặc biệt với cấu trúc vi xốp, siêu thấm, siêu mịn, có khả năng thấm hút gấp nhiều lần so với bông tẩy trang truyền thống sẽ đáp ứng được nhu cầu sử dụng và làm đẹp của bạn. ',N'Việt Nam',N'JOMI',28000,200,N'36 Tháng','889d1d9cc2b2074823850bc9e51e91dda8bbafe1838bd8e7c12dd85bc261b503.jpg'),
(N'Mặt Nạ Giấy Dưỡng Trắng Da Ngọc Trai Vedette Whitening Sheet Mask 22Ml',2,N'Mặt Nạ Giấy Dưỡng Trắng Da Ngọc Trai Vedette Whitening Sheet Mask tăng cường gấp đôi khả năng giúp dưỡng sáng và làm sáng da từ chiết xuất ngọc trai tự nhiên và AHAs. Đặc biệt chiết xuất ngọc trai còn là thành phần chống nắng tự nhiên, bảo vệ da chống lại tác hại của tia UV. Làn da của bạn còn được nuôi dưỡng để trở nên mềm mại và mịn màng hơn nhờ việc bổ sung thêm lượng amino acid cần thiết cho da. Thích hợp cho mọi loại da.',N'Việt Nam',N'VEDETTE',11000,200,N'36 Tháng','f79b0adcf81d8a141ffac056f9cc8688bad278240a6d0bc79929d3726aa48484.png'),
(N'Kem Giảm Mụn Anti Acne Cream Derma 10Gr',2,N'Kem Giảm Mụn Anti Acne Cream Derma 10Gr từ thương hiệu Derma, chứa tinh chất Ngọc trai cùng vitamin E, cho công dụng giảm viêm và giảm sưng tấy hiệu quả.',N'Việt Nam',N'DERMA',19000,200,N'36 Tháng','3001262_1_b58610bc9999444a914068f6e105ba27_8i2no0si1xrlia5i.jpg'),
(N'Kem Dưỡng Ẩm Ngăn Ngừa Lão Hóa Và Nhăn Da Placenta & Vitamin E Rebirth 100Ml',2,N'Kem Dưỡng Ẩm giúp ngừa lão hoá Và Nhăn Da Placenta & Vitamin E Rebirth 100Ml là loại kem chiết xuất từ tinh chất nhau thai cừu phổ biến nhất Australia. Phù hợp cho độ tuổi trên 20. Làm căng các nếp nhăn - các phân tử nhỏ dễ dàng thấm vào da. Tinh chất nhau thai cừu bao gồm vitamin và khoáng chất rất phù hợp cho da. Làm mờ vết sẹo, thâm nám, đốm nâu và tàn nhang. Thích hợp dùng cho ban ngày, không gây nhờn khi sử dụng',N'Australia',N'REBIRTH',153000,200,N'36 Tháng','c47e6b5987a07e1738eafdd102a4e0d6ff16c94c1c90337fc42b26054b8b8a98.jpg'),
(N'Kem Mắt Hỗ Trợ Giảm Thâm The Originote Eye Serum Với Caffeine Peptides Và Chiết Xuất Cam Thảo 15gr',2,N'Kem Mắt Hỗ Trợ Giảm Thâm The Originote Eye Serum Với Caffeine Peptides Và Chiết Xuất Cam Thảo chứa công thức độc quyền để bảo vệ vùng da mắt. Peptides làm căng da vùng mắt, khóa ẩm để chống khô và kích ứng, đồng thời tăng sản xuất collagen. Chiết xuất Cam thảo giúp làm sáng vùng thâm dưới mắt và bảo vệ vùng mắt khỏi tác hại của ánh nắng mặt trời.',N'Trung Quốc',N'THE ORIGINOTE',88000,200,N'36 Tháng','1cbfbd4ceab6291446604fe7490d031ae5b3c632400317683aa5a29a6c4133d8.jpg'),
(N'Gel Dưỡng Cấp Ẩm Chuyên Sâu Deep Moist Gel Cream Senka 50Gr',2,N'Gel Dưỡng Cấp Ẩm Chuyên Sâu Deep Moist Gel Cream Senka 50Gr giúp tạo thành "mặt nạ nước trong suốt" - vừa khóa ẩm tối ưu vừa giữ các dưỡng chất từ các bước chăm sóc da trước đó. Dùng như mặt nạ ngủ.',N'Nhật Bản',N'SENKA',209000,200,N'36 Tháng','guardian_x_cleanser_moist_brighten__thumbnail12_8f2a9d39241c484db26f01503ca5711f_rius0qehzdcz4ymx.jpg')
--
INSERT INTO SANPHAM(TENSP,MADM,MOTA,XUATXU,THUONGHIEU,GIA,SOLUONG,HSD,HINH)
VALUES 
(N'Kem Nền Mịn Nhẹ Kiềm Dầu Maybelline Fit Me Spf22 #115 Ivory 30Ml',3,N'Kem nền kiềm dầu, chống nắng Fit Me dành cho các làn da thường, da dầu và hỗn hợp thiên dầu. Sản phẩm cho một lớp nền mịn mượt, khô thoáng và che phủ “hoàn hảo”. Tiệp với màu da tự nhiên. Bảo vệ làn da trước tác động của ánh nắng.',N'United States',N'MAYBELLINE',209000,200,N'36 Tháng','c12b374a07bb453418c436aa52b17e8e4ae71277de0c99b0db7c4ae924719280.jpg'),
(N'Sáp Dưỡng Môi Vaseline Lips Therapy Rosy Lips Hoa Hồng 7Gr',3,N'Đôi môi khô của bạn sẽ mềm mịn hẳn nếu sử dụng son dưỡng Vaseline Lip Therapy thường xuyên. Cung cấp chất dinh dưỡng, mang lại cho bạn làn da mềm mại. Nó có chức năng vừa là son dưỡng môi, giảm nứt nẻ. Vaseline cho bạn một đôi môi và làn da mềm, mượt mà.',N'United States',N'VASELINE',90000,200,N'36 Tháng','01b4825d08ba1819426233ea22c60eaa0433f74f341f0526fafaaaeb470c5b47.png'),
(N'Son Dưỡng Ẩm Môi Cocoon Dầu Dừa Bến Tre 5g',3,N'Son Dưỡng Cocoon Dầu Dừa Bến Tre 5g là sản phẩm thuộc thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam. Son dưỡng Coon giúp nuôi dưỡng môi của bạn, giúp đôi môi căng mọng, mềm mại và không khô tróc v   i các dưỡng chất từ bơ hạt mỡ, dầu dừa…',N'Việt Nam',N'COCOON',32000,200,N'36 Tháng','4d8b7896c67d5519bef61cf9c9422afcdf4954156f5ce86314a73bc5c5059758.jpg'),
(N'Phấn Má Hồng Judydoll Pretty Blush Powder #49 Cream Raspberry 2gr',3,N'Phấn má hồng Pretty Blush Powder của thương hiệu Judydoll mang lại màu sắc độc đáo giúp tạo thêm vẻ ửng hồng tự nhiên cho má và dễ dàng hòa trộn lên da. Sản phẩm được thiết kế nhỏ gọn xinh xắn, dễ dàng mang theo trong túi trang điểm.',N'Trung Quốc',N'JUDYDOLL',118000,200,N'36 Tháng','untitled_design__1__5672e0ced54f49af92790cb070eee917_kggwmqs4lhkbn0qd.jpg'),
(N'Son Dưỡng Lipice Strawberry Hương Dâu 4,3Gr',3,N'Son dưỡng không màu Lipice Lipbalm Strawberry hương dâu với công thức độc đáo chứa tinh dầu oliu nguyên chất, vitamin C, E, A kết hợp với hương dâu ngọt ngào sẽ giúp dưỡng ẩm tối đa và lưu giữ độ ẩm dài lâu, chống khô, nứt môi. SPF15 bảo vệ môi chống lại tác hại của ánh nắng, giúp môi quanh năm không bị khô hay nứt nẻ. ',N'Nhật Bản',N'LIPICE',64000,200,N'36 Tháng','2908ad2bd1fc3db2ca7921489ea0e38a3dcf54a9eb0839aa9c63d8c84202e6c3.jpg'),
(N'Chì Kẻ Lông Mày Suri Eyebrow Pencil 180 Màu Đen 1,3G',3,N'Chì mềm mại, màu tự nhiên giúp dễ dàng định hình dáng chân mày. Thiết kế đặc biệt, không cần chuốt chì.',N'Taiwan',N'SURI',27000,200,N'36 Tháng','3026698.jpg'),
(N'Mascara Làm Tơi Và Dài Mi Maybelline Lash Sensational Sky High 6Ml',3,N'Mascara Maybelline Làm Dài Và Dày Mi Màu Very Black 6ml là sản phẩm mascara đến từ thương hiệu mỹ phẩm Maybelline của Mỹ, với công thức không thấm nước và mang lại hàng mi cong vút từ mọi góc độ, tạo độ dài và dày mi vô cùng cuốn hút.',N'United States',N'MAYBELLINE',209000,200,N'36 Tháng','1._product_frontgci_5e1d69ae83b049b8b50a7b53ec8e669e_dw3m4f2cswfl7n7n.jpg'),
(N'Kẻ Mắt Nước Pinkflash Easy PFE01 #B01 Màu Đen (Phiên Bản Nâng Cấp) 0.6gr',3,N'Bút kẻ mắt dạng lỏng không tì vết của PinkFlash đã ra mắt với nhiều nâng cấp mới và hiệu quả, tạo ra đường kẻ mắt hoàn hảo.',N'Trung Quốc',N'PINKFLASH',30000,200,N'36 Tháng','6d0f0dbe82c666ee7b5aae5b9408b2fad5db5fc529f6284a2173b62529f61864.jpg'),
(N'Xịt Khóa Nền Colorkey Dành Cho Da Dầu 100Ml',3,N'Dạng sương mịn nhẹ; kết cấu mỏng và mịn màng như làn sương nước, mang lại cảm giác tinh tế và thoải mái mà không gây nhờn dính; sau khi khô giúp lớp nền bền lì và mềm mại, không gây kích ứng cho da.',N'Trung Quốc',N'COLORKEY',199000,200,N'36 Tháng','dd_03.jpg'),
(N'Chì Kẻ Mắt Chống Thấm Nước, Lâu Trôi PinkFlash PFE13 #02 Brown Màu Nâu 3gr',3,N'Bút kẻ mắt dạng gel PinkFlash siêu mảnh mịn mượt không lem, tạo thành một nét vẽ mảnh mai và mượt. Bút kẻ mắt dạng gel này có nhiều lựa chọn màu sắc, từ đen đến nâu cổ điển và mọi màu sắc ở giữa để tìm màu hoàn hảo cho mọi tâm trạng',N'Trung Quốc',N'PINKFLASH',79000,200,N'36 Tháng','ec292b969fa7ab40be2a58dbbbd1b5ed779c45cff9e9e09e0ebe4169a9e8105a.png')
--
INSERT INTO SANPHAM(TENSP,MADM,MOTA,XUATXU,THUONGHIEU,GIA,SOLUONG,HSD,HINH)
VALUES 
(N'Sữa Dưỡng Thể Làm Dịu Da Khô Ngứa Aveeno Skin Relief 354Ml',4,N'Sữa dưỡng thể làm dịu da nhạy cảm, khô ngứa Aveeno Skin Relief 354ml với chiết xuất tự nhiên từ 3 phức hợp yến mạch với kết cấu kem dưỡng ẩm cô đặc. Giúp duy trì làn da khỏe mạnh. Hiệu quả làm dịu da khô gây ngứa sau 20s. Và cân bằng độ pH và giữ cho làn da được giữ ẩm trong 24 giờ.',N'United States',N'AVEENO',499000,200,N'36 Tháng','3029379_7a818ea6701e4626bd8cd29ecbfe3077_large.png'),
(N'Sơn Móng Tay Nước Bóng Cb002 Felina 18Ml',4,N'Sơn móng tay Felina 18Ml với nguyên liệu sản xuất hoàn toàn nhập từ Pháp, giúp bảo vệ móng và màu sơn nhờ tính năng bảo vệ trước tia uv, nuôi dưỡng và tái tạo móng với dưỡng chất Keratin (thành phần cấu tạo nên móng). Công thức nhanh khô, màu bám lâu, giúp bạn ngay lập tức có được bộ móng hoàn hảo. An toàn cho người sử dụng: 5 không (Toluene, Formaldehyde, DBP, Camphor,',N'Việt Nam',N'FELINA',39000,200,N'36 Tháng','1aa6e9218d31fe6bc676af13ba84fdeac66544809fc7cfdc1e24e336cd617f38.jpg'),
(N'Nước Chùi Móng Không Acetone Hương Hoa Tổng Hợp Felina 175Ml',4,N'Nước chùi móng FELINA với công thức độc quyền không acetone, kết hợp dầu hạt mơ và keratin giúp tẩy sạch nhanh màu sơn mà không khô da, hại móng, dưỡng ẩm vùng da quanh móng; nuôi dưỡng và tái tạo móng',N'Việt Nam',N'FELINA',69000,200,N'36 Tháng','0fbaa574a44448b99952b993655b8f18f4a1a81d9f96ba77d78176ead55c97cd.jpg'),
(N'Kem Ngăn Ngừa & Giảm Rạn Da Cocoa Butter Formula Massage Cream For Stretch Marks PAlmer S 125Gr',4,N'Công thức cải tiến mới của Palmer s bao gồm Bio C-Elaste TM, một hỗn hợp thành phần tiên tiến chống lại vết rạn da, cải thiện độ đàn hồi, duy trì độ ẩm cho da cũng như ngăn ngừa và xóa mờ vết rạn da dùng cho phụ nữ mang thai hoặc những người bị rạn da do lên cân. ',N'United States',N'PALMERS',293000,200,N'36 Tháng','3000013.png'),
(N'Dầu Dưỡng Hỗ Trợ Mờ Sẹo & Giảm Rạn Da Bio Oil 60Ml',4,N'Dầu Chăm Sóc Da Bio-Oil Specialist Skincare Oil là dòng sản phẩm chăm sóc da từ thiên nhiên nổi tiếng của thương hiệu Bio-Oil đình đám đến từ nước Úc, với khả năng làm giúp làm giảm các vết rạn da, mờ sẹo và làm đều màu da hiệu quả. Sản phẩm được sản xuất tại Nam Phi theo tiêu chuẩn cGMP, đã qua kiểm nghiệm nghiêm ngặt và có nghiên cứu lâm sàng, an toàn cho mọi loại da sử dụng. ',N'Australia',N'BIO OIL',166000,200,N'36 Tháng','418df7223c38fe1460c98f5f66fab2ac72f89e0c131b88302deba6a49c0a75e3.png'),
(N'Bọt Cạo Râu Hương Chanh Foamy Lemon Lime Gillette 175Gr',4,N'Bọt Cạo Râu Hương Chanh Gillette Foamy Lemon Lime  tác dụng làm mềm chân râu và làm mềm da, giúp cho việc cạo râu trở nên dễ dàng và nhanh chóng hơn. Đồng thời bọt cạo râu còn tạo một lớp trung gian, ngăn không cho dao cạo tiếp xúc trực tiếp với da hạn từ đó hạn chế trầy xước tối đa. Ngoài ra, bọt cạo râu còn chứa thành phần dưỡng chất từ nha đam, giúp làm dịu và mát da sau khi cạo.',N'United States',N'GILLETTE',98000,200,N'36 Tháng','3dfee89e383afa3b2f1c7d7e9c362f5e01e3545d2e8702b1694bc07dc755bc31.jpg'),
(N'Lăn Khử Mùi Rexona Mát Lạnh Sảng Khoái Cho Nữ 50Ml',4,N' Lăn Khử Mùi Cho Nữ Mát Lạnh Sảng Khoái Rexona Shower Clean Dry & Fresh Confidence với công thức đặc biệt có khả năng khử mùi và ngăn ngừa mồ hôi giúp cơ thể và vùng da dưới cánh tay khô thoáng và thoải mái suốt ngày dài. Mùi hương tươi mát dễ chịu của sản phẩm sẽ khiến bạn cảm thấy sảng khoái, tự tin tham gia mọi hoạt động mà không phải e ngại về mùi cơ thể',N'Australia',N'REXONA',57000,200,N'36 Tháng','f4971f1da4235041cb1f1e48bd8c637ae72ce294f11c8885a10027310f63e226.jpg'),
(N'Cà Phê Đắk Lắk Làm Sạch Da Chết Cơ Thể Cocoon Dak Lak Coffee Body Polish 200Ml',4,N'Cà Phê Đắk Lắk Làm Sạch Da Chết Cơ Thể thương hiệu Cocoon được làm từ những hạt cà phê Đắk Lắk xay nhuyễn giàu cafeine hòa quyện với bơ cacao Tiền Giang, giúp bạn loại bỏ lớp tế bào chết già cỗi và xỉn màu, đánh thức làn da tươi mới đầy năng lượng cùng cảm giác mượt mà và mềm mịn lan tỏa.',N'Việt Nam',N'COCOON',125000,200,N'36 Tháng','1_1__988d8f609f5140c59b71f230d5b606dd_pvvbbjkblly7se6e.png'),
(N'Kem Dưỡng Da Tay Reihaku Hatomugi 65Gr',4,N'Kem Dưỡng Tay Hatomugi The Hand Cream đến từ thương hiệu Hatomugi nổi tiếng của xứ sở hoa anh đào Nhật Bản, sản phẩm với thành phần chiết xuất từ hạt ý dĩ giúp cung cấp dưỡng chất và độ ẩm cho da tay, giúp da tay mềm mịn và tươi sáng hơn.',N'Nhật Bản',N'REIHAKU HATOMUGI',42000,200,N'36 Tháng','3022092-1_ab7bace4fa26454b9a9f0f5a49f83a13_ix0fohgmhx6qybfb.jpg'),
(N'Gel Khử Mùi Cool Wave Gillette 107Gr',4,N'Gel khử mùi nam Gillette hương Cool Wave 107Gr nhập khẩu từ Mỹ, giúp ngăn tiết mồ hôi và khử mùi cho vùng da dưới cánh tay, dạng Gel trong suốt không để lại vệt và làm ố vàng áo',N'United States',N'GILLETTE',144000,200,N'36 Tháng','e99246278adb896bd28df1c6cc6d49e21d4b7514a171416566b9438904a1ca1b.jpg')
--
INSERT INTO SANPHAM(TENSP,MADM,MOTA,XUATXU,THUONGHIEU,GIA,SOLUONG,HSD,HINH)
VALUES 
(N'Miếng Dán Hỗ Trợ Giảm Ho Yukazan Adult Cough Relief Medical Patch Cho Người Lớn Gói 2 Miếng ',5,N'Miếng Dán Giảm Ho Cho Người Lớn - Gói 2 Miếng của thương hiệu Yukazan giúp Giảm ho - Giảm đờm - Giảm khó chịu và Giảm đau họng. Sản phẩm chứa chiết xuất tre phát ra tia hồng ngoại xa có thể xuyên qua tới 3,5 inch bên dưới da, giúp cải thiện tuần hoàn vi mô và tăng cung cấp oxy.',N'Malaysia',N'YUKAZAN',40000,200,N'36 Tháng','yukazan_adult_cough_relief_medical_patch_2s_front.jpg'),
(N'Viên Sủi Hỗ Trợ Hỗ Trợ Giảm Cân Vị Chanh Everslim 73,8Gr',5,N'Viên Sủi Hỗ Trợ Giảm Cân Vị Chanh, Vị Lựu EverSlim Flavor là sản phẩm thực phẩm chức năng hỗ trợ giảm cân thuộc thương hiệu Ever Slim đến từ Hàn Quốc. Với thành phần chính chứa chiết xuất từ quả Bứa, Niacin cùng Patothenic Acid có tác dụng hỗ trợ giảm cân, giúp bổ sung năng lượng cùng vitamin cho cơ thể. Sản phẩm dạng sủi có vị chanh chua dịu thơm mát, dễ uống, vừa ngon miệng vừa tốt cho sức khỏe.',N'Korea',N'EVER SLIM',165000,200,N'36 Tháng','45bbbd095d1f9356e4d3575d038a78a65df7c358c3fe6c9a18f8527903cc2ff2.jpg'),
(N'Nước Muối Sinh Lý Vĩnh Phúc Natri Clorid 0,9% 1100ml',5,N'Nước Muối Sinh Lý Natri Clorid 0,9% của Vĩnh Phúc chứa Natri Clorid được pha loãng với nước tinh khiết tỉ lệ 0.9%. Nước muối sau khi qua hệ thống lọc đều được chạy qua tia UV để tiêu diệt 99.99% vi khuẩn và loại bỏ tất cả những tạp chất có trong nước, giúp bạn hoàn toàn an tâm về chất lượng sản phẩm.',N'Việt Nam',N'VINH PHUC',14000,200,N'36 Tháng','1245ea9064e013c0f23119e88a7de37797a20484dbd11b273925d6d50c5d74a6.jpg'),
(N'Que Thử Thai Nhanh Tại Nhà Quickstick Hộp 1 Cái',5,N'Quickstick là một nhãn hàng tiên phong đưa que thử thai đến gần hơn với các chị em phụ nữ ở Việt Nam, QuickStick vẫn luôn phát huy tối đa vai trò của mình trong việc phát hiện có thai sớm nhất và chính xác nhất cho các chị em',N'United States',N'QUICKSTICK',22000,200,N'36 Tháng','cbca9972ff048a59000e51f03d1c5e44b6ca229f52da219ace1b7d51ed6e7a29.jpg'),
(N'Viên Uống Hỗ Trợ Cấp Nước Aqua Rich Innerb 56 Viên',5,N'Thực Phẩm Bảo Vệ Sức Khỏe InnerB Aqua Rich Doubleup Cấp Ẩm Hỗ Trợ Sáng Mịn Bảo Vệ Da 56 Viên 33.6g là Thức Uống Hỗ Trợ Sức Khỏe & Làm Đẹp của thương hiệu Innerb (thuộc tập đoàn CJ) đến từ Hàn Quốc, được bào chế ở dạng viên uống giúp cấp nước, bổ sung độ ẩm cho da căng mượt, mịn màng, từ đó ngăn ngừa nếp nhăn và các dấu hiệu lão hóa, mang lại cho bạn làn da rạng rỡ và tươi trẻ',N'Korea',N'INNERB',464000,200,N'36 Tháng','12b91d9507cd172b24a4fa89b5ed55761d89792cb7ed59490f55369fcac02978.jpg'),
(N'Miếng Dán Xông Hơi Vùng Bụng Megrhythm Hộp 5 Miếng',5,N'Miếng dán nóng xông hơi MegRhythm tiếp cận những người bị đau vai, thắt lưng ; Phụ nữ bị đau bụng kinh. Họ muốn chăm sóc bản thân ngay cả khi đang làm việc trong cuộc sống bận rộn. Những đối tượng này có nhu cầu tìm kiếm một giải pháp thư giãn nhanh chóng và hiệu quả',N'Nhật Bản',N'MEGRHYTHM',160000,200,N'36 Tháng','6030582d96b4cee4d2e45c499e63e2f35ba8afedc789f0c9497ce2b5dfb4ae02.png'),
(N'Viên Uống Biotin DHC Hỗ Trợ Giảm Rụng Tóc 30 Viên',5,N'Viên uống Biotin giúp mọc tóc của DHC là một loại thực phẩm chức năng giúp mọc tóc; làm đẹp da; ngăn rụng tóc do dị ứng, viêm da cơ địa; tăng cường thể lực',N'Nhật Bản',N'DHC',125000,200,N'36 Tháng','44968b4727c50b5521322f2b023ee74b660c65703cb744436bb2aeaf5424aa74.jpg'),
(N'Viên Uống Hỗ Trợ Tim Mạch Blackmores CoQ10 150mg 30 Viên',5,N'Viên Uống Hỗ Trợ Tim Mạch CoQ10 150mg 30 Viên của Blackmores được nhập khẩu từ Úc, giúp chống oxy hóa và tăng cường năng lượng cho tim, hỗ trợ duy trì sức khỏe tim mạch và làm chậm quá trình lão hóa cơ thể. ',N'Australia',N'BLACKMORES',547000,200,N'36 Tháng','e490c8ce54c6beb70bccc3f7d706a0ac14e297832a21c04800c34f1ca47a3be0.png'),
(N'Thực Phẩm Chức Năng Kinohimitsu Prowhite Giúp Hỗ Trợ Sáng Da Và Gan Khoẻ Mạnh 8gr X 30 Gói',5,N'Kinohimitsu Prowhite là thực phẩm chức năng hỗ trợ tăng cường hệ miễn dịch và cải thiện làn da đến từ thương hiệu Kinohimitsu Singapor. Sản phẩm chứa Glutathione và hai loại siêu trái cây là quả Camu-Camu và Maqui Berry giúp làm mờ đốm nâu và giảm stress.',N'Taiwan',N'KINOHIMISTU',1461000,200,N'36 Tháng','3011645_2_c7966abe84334cb29f922628dced4315_uhgqbux2qdqdfhdc.jpg'),
(N'Băng Cá Nhân Trong Suốt Transparent 4 Kích Cỡ Urgo 20 Miếng',5,N'Băng Cá Nhân Trong Suốt Transparent 4 Kích Cỡ Urgo 20 Miếng có tính thẩm mỹ cao, nhiều lỗ thoát khí nhỏ, giúp da thông thoáng. Gạc không dính vào vết thương, không gây đau khi thay băng',N'Pháp',N'URGO',26000,200,N'36 Tháng','b11c327a1011acf12c7f26b9161d480ff6e9e52a19c5ff1d9aac07412415cbd9.jpg')
--
INSERT INTO SANPHAM(TENSP,MADM,MOTA,XUATXU,THUONGHIEU,GIA,SOLUONG,HSD,HINH)
VALUES 
(N'Dụng Cụ Vệ Sinh Lưỡi Beauty Formulas 1 Cái',6,N'- Dụng Cụ Vệ Sinh Lưỡi Beauty Formulas Tongue Cleaner có thiết kế độc đáo, giúp bạn dễ dàng làm sạch các mảng bám trên lưỡi, ngăn ngừa vi khuẩn gây hôi miệng, lợi',N'United Kingdom',N'BEAUTY FORMULAS',61000,200,N'36 Tháng','3c1158ad1d6e17a7da477321c9a11c99d13786a247414e9b660f2924d1cbcc09.jpg'),
(N'Bộ Chăm Sóc Răng Miệng Thích Hợp Cho Du Lịch Colgate Từ Than Hoạt Tính',6,N'Bộ chăm sóc răng miệng của Colgate nhỏ gọn, tiện lợi giúp bạn dễ dàng chăm sóc răng miệng toàn diện ngay cả khi đi du lịch hay công tác xa',N'United States',N'COLGATE',72000,200,N'36 Tháng','eedbaf48a49a933a310d918fd1c8d921a346b4421bb45f4985a62a09377e286b.png'),
(N'Khăn Tắm Nén Beyaki 100% Bông Cotton Loại 70x100cm',6,N'Khăn tắm viên nén Beyaki được làm từ 100% sợi bông cotton thực vật không pha tạp chất, an toàn cho mọi loại da và sức khỏe người dùng. Sản phẩm sử dụng được cho trẻ em dưới 36 tháng tuổi theo quy định Thông Tư 21/2017/TT-BCT của Bộ Công Thương.',N'Việt Nam',N'BEYAKI',18000,200,N'36 Tháng','3028337.jpg'),
(N'Khẩu Trang Y Tế 4D Bush Màu Trắng 10 Cái',6,N'Khẩu Trang Y Tế 4D Bush Màu Trắng 10 Cái với cấu tạo 4 lớp, gồm 2 lớp đầu là vải không dệt, lớp 3 là lớp giấy vi lọc Meltblown độ lọc khuẩn 99%, lớp 4 là lớp vải không dệt bên trong tiếp xúc với da, không có lông tơ gây ngứa và dị ứng. Nguyên liệu an toàn có nguồn gốc xuất sứ rỏ ràng. Quai đeo màu trắng, chất liệu thun co giản cao, chắc chắn, không làm đau tai. Nẹp nhựa có lỏi thép giúp ôm vừa khích với khuôn mặt',N'Việt Nam',N'BUSH',14000,200,N'36 Tháng','3025886-2_fbb74a9098374acaa056a0ae708a5c62_afd7531d37c24000ad11fca07c283a58_ash3wjtazahz50wu.jpg'),
(N'Nước Hoa Nam Bouncy Gota 50Ml',6,N'Nước Hoa Nam Bouncy Gota 50Ml với hương thơm mở ra là hương cam quýt ngào ngạt pha lẫn một chút vị tarragon. Ở lớp hương giữa, mùi hương của oải hương và gỗ tuyết tùng xuất hiện, kết hợp với hương táo rất nhẹ và dễ gần. Lớp hương cuối cùng đóng lại với mùi hương trầm ấm và kéo dài rất đặc trưng của vani, xạ hương và hổ phách. Tất cả mùi hương đem đến cho GOTA BOUNCY một chút phức tạp trong tính cách: Bí ẩn, táo bạo nhưng không kém phần tinh tế, quyến rũ ',N'Việt Nam',N'GOTA',277000,200,N'36 Tháng','bf19ee45ffde78a093fad8d0241435200c2dc56c34af7b01a0e9f85be345c14f.jpg'),
(N'Nước Hoa Hương Trái Cây Dịu Ngọt Tím Jolly Rhythm Pucelle 75Ml',6,N'Pucelle là một thương hiệu của Mandom. Mandom là một tập đoàn của Nhật Bản được thành lập năm 1927, chuyên sản xuất và kinh doanh Nước hoa - Mỹ phẩm, phân phối trên 120 quốc gia, có 3 nhà máy ở Nhật Bản, Indonesia và Trung Quốc. Hiện tại công ty sở hữu 14 thương hiệu, Pucelle là một trong số đó. Pucelle nhắm tới mục tiêu sản phẩm chất lượng tốt, không gây hại tới sức khỏe và môi trường cũng như giá thành phù hợp',N'Nhật Bản',N'PUCELLE',28000,200,N'36 Tháng','c4ca29dc75fee89a6b7970ad41d60869370fb9ee8d77702000c2fd54ee3f9c98.jpg'),
(N'Nước Súc Miệng Giúp Làm Trắng Răng Healthy Bright Listerine 750Ml',6,N'Nước Súc Miệng Giúp Làm Trắng Răng Healthy Bright Listerine 750ML',N'United States',N'LISTERINE',94000,200,N'36 Tháng','listerine_eshop_guardian_600px_x_600px_-17.jpg'),
(N'Nước Hoa Cindy Bloom Aroma Flower 50Ml',6,N'Cô gái thành thị luôn khao khát hòa mình vào thiên nhiên để tìm ra nguồn cảm hứng sống mới thì không thể bỏ qua hương thơm ngọt lành từ trái cây mọng nước kết hợp với hương hoa anh thảo, táo gai và hồng nhung, dịu dàng pha chút năng động. Đọng lại ấm áp, ngọt ngào bởi hổ phách, tuyết tùng và xạ hương trắng.',N'Việt Nam',N'CINDY',233000,200,N'36 Tháng','8f654def4a309b0ae4de979471ca1aeffabe11f3e542aee15eb4097e662b96de.jpg'),
(N'Nước Hoa Hương Rêu Sồi Cuốn Hút Swimming At Riverside Dynik',6,N'Nước Hoa Hương Rêu Sồi Cuốn Hút Swimming At Riverside Dynik với mùi hương thuộc nhóm rêu sồi với các note cam chanh khởi đầu, kết hợp với rêu sồi, hương thảo, khói thơm nịnh mũi ở tầng giữa và tầng cuối. Riverside là sự lựa chọn hoàn hảo cho entry level - những bạn tìm kiếm mùi hương dễ dùng trong mọi dịp, dễ chịu với bất kì ai tiếp xúc.',N'Việt Nam',N'DYNIK',229000,200,N'36 Tháng','3022087-3_7c7b5664f2864cc19753f5c9c5c40d40_5rzsf7gindck5woj.jpg'),
(N'Kem Đánh Răng Sensodyne Rapid Action 100G',6,N'Là dòng kem đánh răng đến từ thương hiệu chăm sóc răng miệng Sensodyne của Anh, giúp làm sạch răng miệng, ngăn ngừa sâu răng mang lại cảm giác sạch sẽ và thơm mát. ',N'United Kingdom',N'SENSODYNE',99000,200,N'36 Tháng','3020850_4.jpg')
--
INSERT INTO SANPHAM(TENSP,MADM,MOTA,XUATXU,THUONGHIEU,GIA,SOLUONG,HSD,HINH)
VALUES 
(N'Wax Tạo Kiểu Tóc Gatsby Styling Mat & Hard Dày Bồng Cá Tính 75gr',7,N'Tốt nhất cho các kiểu tóc rối ngẫu nhiên. Phù hợp với cả tóc ngắn, trung bình và mái tóc dài.',N'Nhật Bản',N'GATSBY',62000,200,N'36 Tháng','5c88194b4730f75c2ce7a001856dce5f85599b85281b193822dfceaa7955787f.jpg'),
(N'Kem Ủ Tóc Giúp Phục Hồi Tóc Hư Tổn Dove 200ml',7,N'Kem ủ tóc đến từ thương hiệu Dove không chỉ giúp phục hồi hư tổn ngay sau 1 lần gội mà còn ngăn ngừa 95% tóc hư tổn. Công nghệ phục hồi hư tổn cao cấp kết hợp sức mạnh Advanced Keratin Shot và Hydro Filler, bảo vệ tóc trước tác động nhiệt và hóa chất. Sản phẩm giúp phục hồi tóc khô và tái cấu trúc hư tổn nặng từ sâu bên trong, nuôi dưỡng tóc chắc khỏe, bồng bềnh.',N'United States',N'DOVE',110000,200,N'36 Tháng','thay_doi_bao_bi__14___1__288cb2ccef7043179cb159467b3835d8_olwgcpdhbn6ysrbx.png'),
(N'Wax Vuốt Tóc Giúp Giữ Nếp Và Tạo Độ Bóng Cho Tóc Gatsby Pomade Perfect Raise 75gr',7,N'Wax vuốt tóc của Gatsby có khả năng giữ nếp tự nhiên và tạo độ bóng cho tóc',N'Nhật Bản',N'GATSBY',69000,200,N'36 Tháng','d3958d9b0333848b596588655e73d946e242a5ba9b96cb25bcf092abc96491aa.jpg'),
(N'Dầu Xả Bưởi Giúp Giảm Gãy Rụng, Nuôi Dưỡng Tóc Cocoon 310ml',7,N'Sự kết hợp hài hoà giữa tinh dầu bưởi Việt Nam truyền thống, vitamin B5 và hoạt chất dưỡng ẩm Xylishine™ đã tạo nên dầu xả bưởi của thương hiệu Cocoon giàu dưỡng chất giúp giảm gãy rụng và làm mềm từng sợi tóc, mang lại mái tóc mượt mà và nhẹ nhàng sau khi xả.',N'Việt Nam',N'COCOON',195000,200,N'36 Tháng','666dbf71b7cf85df46100e1ffafc24f7a4e6a847c4b0dc2dbbc60b4cdd1433e2.png'),
(N'Kem Ủ Tóc Phục Hồi Hư Tổn, Cho Tóc Suôn Mượt Fino Premium Touch 230gr',7,N'Kem ủ và hấp tóc Fino Premium Touch Shiseido 230g được chiết xuất từ thành phần đặc biệt đó chính là chất Gelundaina mang lại hiệu quả cải thiện tóc hư tổn, giúp phục hồi tóc hư hỏng gẫy rụng, giúp dưỡng ẩm, loại bỏ bụi bẩn và bã nhờn trên tóc, giúp tóc hấp thu dưỡng chất tốt nhất. Chỉ sau thời gian ngắn sử dụng mái tóc của bạn sẽ bóng mượt tự nhiên, mềm, dễ chải và quyến rũ. ',N'Nhật Bản',N'FINO',136000,200,N'36 Tháng','gdn_thumb_extra_1_5bba095581fb4e288bc12569773b2d02_wtncvr3n87vousix.jpg'),
(N'Keo Tạo Kiểu, Giữ Nếp Tóc Trong Nhiều Giờ Double Rich Hair Styling Strong Hold Dạng Xịt 170Ml',7,N'Keo tạo kiểu tóc của thương hiệu Double Rich Hair với thành phần giàu dưỡng chất cung cấp vitamin và độ ẩm giữ tóc khỏe mạnh và óng mượt, bảo vệ tóc dưới tia UV.',N'Korea',N'DOUBLE RICH',67000,200,N'36 Tháng','5726a27d94f2a4c61d773ff4c478e6be54db98659c82857132aa5bf6cd72be36.jpg'),
(N'Gôm Xịt Tóc Gatsby Set & Keep Spray Super Hard Siêu Cứng 250ml',7,N'Gôm xịt tóc siêu cứng của Gatsby giúp tạo kiểu, định hình kiểu tóc, giữ nếp tự nhiên, giữ kiểu lâu, giúp tóc bóng mượt mà không bết dính, không để lại dư chất trên tóc',N'Nhật Bản',N'GATSBY',90000,200,N'36 Tháng','3020154-3_eb7df3b304ff455586479964641d48dd_lf7i6kbmnavjanf0.jpg'),
(N'Gel Vuốt Tóc Siêu Cứng Và Bóng Tóc X-Men Super Strong Hold & Wet Look 150gr',7,N'Gel vuốt tóc của thương hiệu X-Men với công thức “Super Strong Hold & Wet Look” giúp tạo nếp siêu cứng ở cấp độ 6 với hiệu quả kéo dài đồng thời mang lại độ bóng tối ưu cho tóc. X-Men sẽ giúp bạn khẳng định được phong cách nam tính của mình với những kiểu tóc ấn tượng và hoàn hảo nhất.',N'Việt Nam',N'X MEN',60000,200,N'36 Tháng','5ac6caeebd1ff59966a13de012d18d601c48b42f34c98cbb82d8782dd24289d5.jpg'),
(N'Kem Ủ Tóc Dưỡng Tóc Nhuộm Ellips Hair Mask Nutri Color 20gr',7,N'Kem ủ tóc Ellips Hair Mask là dòng sản phẩm mặt nạ ủ tóc thuộc thương hiệu chăm sóc tóc Ellips xuất xứ từ Indonesia. Công thức sản phẩm chứa các thành phần như vitamin A, C, E và Pro Vitamin B5 giúp cung cấp dưỡng chất cho mái tóc thật sự khỏe mạnh. Ngoài ra, mỗi loại kem ủ tóc còn được thiết kế để phù hợp với các nhu cầu khác nhau của mái tóc',N'Indonesia',N'ELLIPS',12000,200,N'36 Tháng','3013902.jpg'),
(N'Lược Nhựa Răng Thưa Mee Style',7,N'Lược Nhựa Răng Thưa Mee Style',N'Việt Nam',N'MEE BEAUTIE',31000,200,N'36 Tháng','71d5d65c58588811fba85f6ac9d2fb78f0193f2a43af3d67215ce351f630d864.jpg')
--
INSERT INTO SANPHAM(TENSP,MADM,MOTA,XUATXU,THUONGHIEU,GIA,SOLUONG,HSD,HINH)
VALUES 
(N'Sữa Tắm Gội Trẻ Em Milky Lactacyd 500Ml',8,N'Sữa Tắm Gội Trẻ Em Milky Lactacyd 500Ml là sản phẩm tắm gội cho em bé đến từ thương hiệu Lactacyd của Pháp, công th  c chứa thành phần tự nhiên là Organic Acid và các loại vitamin, giúp bảo vệ cho làn da và tóc của bé, đồng thời giúp nuôi dưỡng cho làn da và mái tóc bé thêm mịn màng và mềm mượt',N'Việt Nam',N'LACTACYD',165000,200,N'36 Tháng','a90a7bfbc7b7765690dce5d201fa6ac9f2a3617c5121b222bf0802e06e362fc4.png'),
(N'Viên Uống Bổ Sung Vitamin Tổng Hợp Blackmores Dành Cho Phụ Nữ Mang Thai Và Cho Con Bú Pregnancy And Breast Feeding Advanced 60 Viên',8,N'Viên Uống Bổ Sung Vitamin Tổng Hợp Blackmores Dành Cho Phụ Nữ Mang Thai Và Cho Con Bú Pregnancy And Breast Feeding Advanced của Blackmores, hỗ trợ bổ sung vitamin, dưỡng chất, khoáng chất cần thiết cho phụ nữ mang thai và cho con bú.',N'Australia',N'BLACKMORES',438000,200,N'36 Tháng','09e2c3017f0f482d7eb1323465637a8877e846329acf1157895945f4d9a189d3.jpg'),
(N'Sữa Dưỡng Thể Dịu Nhẹ Như Bông Cotton Touch JohnsonS Baby 200Ml',8,N'Sữa dưỡng thể (dưỡng ẩm) Johnsons Face & body Lotion Cotton Touch có tác động rất dịu nhẹ lên làn da nhạy cảm của trẻ sơ sinh. Làn da bé mỏng hơn 30% so với da người lớn, do đó cần được nâng niu chăm sóc tuyệt đối nhẹ nhàng và yêu thương',N'United States',N'JOHNSON & JOHNSON',79000,200,N'36 Tháng','fb97cec0b34f7cdc4246b0873a39483c8c45edc633bcc077d89645ceb2e0ba5b.jpg'),
(N'Dầu Gội Em Bé Cetaphil 200Ml',8,N'Dầu Gội Dịu Nhẹ Cho Bé Cetaphil Baby Shampoo với công thức đặc biệt không làm cay mắt, Dầu gội dịu nhẹ cho bé Cetaphil Baby Shampoo với công thức PH trung tính, nhẹ nhàng làm sạch tóc và da đầu của trẻ sơ sinh, đồng thời giúp duy trì lớp bảo vệ da tự nhiên cho da đầu của trẻ sơ sinh luôn khỏe mạnh.',N'United States',N'CETAPHIL',147000,200,N'36 Tháng','de7db3978a679dbd12b588a0d11d78541d881528807d8e69c6f7a9849113388a.png'),
(N'Thực Phẩm Bảo Vệ Sức Khỏe Kẹo Ngậm Hỗ Trợ Mắt Rohto Clear Vision Junior Túi 60 Viên 48G',8,N'Bổ sung dinh dưỡng giúp bảo vệ tế bào võng mạc mắt, hỗ trợ duy trì thị lực và giảm nguy cơ cận thị. Kẹo ngậm Rohto Clear Vision Junior với hàm lượng cao Crocetin 2,5g từ cây dành dành, Lutein từ cúc vạn thọ, Bilberry từ việt quất đen, giúp bổ sung dinh dưỡng cho mắt, bảo vệ tế bào võng mạc, hỗ trợ duy trì thị lực và giảm nguy cơ cận thị.',N'Nhật Bản',N'ROHTO',385000,200,N'36 Tháng','3027411.jpg'),
(N'Tắm Gội Gennie Baby 2In1 For Baby 400Ml',8,N'Tắm Gội Em Bé Gennie Baby 2In1 Shampoo & Body Wash chiết xuất chính từ tơ tầm kết hợp cùng các thành phần thiên nhiên lành tính như cúc la mã, mầm lúa mì, tinh dầu hạt macca, bơ, dầu đậu nành, jojoba, tảo biển..., nhẹ nhàng làm sạch và nuôi dưỡng dịu nhẹ làn da nhạy cảm và mái tóc mỏng manh của bé sơ sinh.',N'Việt Nam',N'GENNIE',119000,200,N'36 Tháng','12_copy_f35f457c7d464b7c99bd005d98a37ef0_jpgmbon4911a17vh.jpg'),
(N'Sữa Tắm Gội Toàn Thân Cho Bé Cetaphil 230Ml',8,N'Sữa tắm gội dịu lành Cetaphil Baby Gentle Wash & Shampoo với các thành phần từ thiên nhiên giúp chăm sóc và làm sạch làn da mỏng manh của trẻ sơ sinh, đồng thời bảo vệ và cung cấp độ ẩm cho sự phát triển khỏe mạnh của da bé.',N'United States',N'CETAPHIL',147000,200,N'36 Tháng','f08f1deb2a3dd1b0d03f6b316534d16b67a9ee2078a4fa319fa3c509f204ca06.png'),
(N'Kem Giúp Ngừa Hăm Sudocrem 60G',8,N'Kem hăm tã Sudocrem có thành phần chính là oxit kẽm giúp làm liền da kết hợp cùng Benzyl có tác dụng chống khuẩn đem đến hiệu quả nhanh chóng làm dịu những vết hăm tã cho bé.',N'Ireland',N'SUDOCREAM',110000,200,N'36 Tháng','d90bb2d2b3c4c547136eae0f53807073bdba5edd216707f56bd90b9c9f420d47.png'),
(N'Dầu Tắm Gội Kids 3 In 1 Strawberry Splash White Rain 354Ml',8,N'Sữa Tắm Gội Xả White Rain Kids 3 in 1 Strawberry Splash được chiết xuất từ dâu tây, mang lại v   ngọt ngào cho làn da bé. Đặc biệt công thức không cay mắt, dưỡng và chống xơ rối cho tóc, đồng thời làm sạch da, loại bỏ chất bẩn và mồ hôi sau một ngày dài vui chơi của bé',N'United States',N'WHITE RAIN',58000,200,N'36 Tháng','60fea74749ae873c9710957b79820d93d71ad1ebf77eee0dee503cea1acec61c.jpg'),
(N'Kem Dưỡng Da Trẻ Em Baby Daily Lotion With Organic Calendula Cetaphil 400Ml',8,N'Sản phẩm kem dưỡng da dành cho trẻ em Cetaphil Baby Daily Lotion With Organic Calendula 400Ml là dòng sản phẩm cao cấp của thương hiệu Cetaphil với công thức đặc biệt dành cho mọi loại da em bé, được Viện Da Liễu Châu Âu chứng nhận độ an toàn cho da cũng như được nhiều bác sĩ khoa nhi khuyên dùng.',N'United States',N'CETAPHIL',308000,200,N'36 Tháng','ce28ac2dc49d8ad95b1b7863c679b83a50df0dedf23a574ab1c177c7d05eced9.png')
--
drop table NGUOIDUNG
CREATE TABLE NGUOIDUNG
(
	MAND INT IDENTITY (1,1) PRIMARY KEY,
	HOTEN NVARCHAR(50) NOT NULL,
	NGAYSINH DATE,
	GIOITINH NVARCHAR(5) CHECK (GIOITINH IN (N'Nam', N'Nữ')), -- Ràng buộc CHECK cho giới tính
	EMAIL NVARCHAR(50) UNIQUE, -- Đảm bảo email là duy nhất
	DIACHI NVARCHAR(150),
	SDT NVARCHAR(20) UNIQUE, -- Đảm bảo số điện thoại là duy nhất
	TAIKHOAN VARCHAR(30) NOT NULL UNIQUE, -- Đảm bảo tài khoản là duy nhất
	MATKHAU VARCHAR(30) NOT NULL,
	THOIGIANTAO DATETIME DEFAULT GETDATE()
);

--
SET DATEFORMAT DMY
INSERT INTO NGUOIDUNG(HOTEN,NGAYSINH,GIOITINH,EMAIL,DIACHI,SDT,TAIKHOAN,MATKHAU)
VALUES 
(N'Nguyễn Chí Hào', '21-07-2001',N'Nam','chihao@gmail.com','HCM','0987685422','chihao','123'),
(N'Trần Thị Tuyết', '16-06-2002',N'Nữ','tuyettran@gmail.com','HCM','0887876565','tuyettran','123'),
(N'Nguyễn Thành An', '11-02-2002',N'Nam','thanhan@gmail.com','HCM','0339847857','thanhan','123')

--
CREATE TABLE QUYEN 
(
	MAQUYEN INT IDENTITY (1,1) PRIMARY KEY,
	TENQUYEN NVARCHAR(20) NOT NULL UNIQUE -- Đảm bảo tên quyền là duy nhất
);
--
INSERT INTO QUYEN (TENQUYEN)
VALUES 
(N'Quản lý'),
(N'Nhân viên'),
(N'Khách hàng')
--
CREATE TABLE QUYENND
(
	MAND INT NOT NULL,
	MAQUYEN INT NOT NULL,
	CONSTRAINT PK_QUYENND PRIMARY KEY (MAND, MAQUYEN),
	CONSTRAINT FK_QUYENND_NGUOIDUNG FOREIGN KEY (MAND) REFERENCES NGUOIDUNG(MAND),
	CONSTRAINT FK_QUYENND_QUYEN FOREIGN KEY (MAQUYEN) REFERENCES QUYEN(MAQUYEN)
);
--
INSERT INTO QUYENND (MAND,MAQUYEN)
VALUES 
(1,1),
(2,2),
(3,3)
--
CREATE TABLE GIAMGIA
(
	MAGG INT IDENTITY (1,1) PRIMARY KEY,
	TENGG NVARCHAR(30) NOT NULL,
	PHANTRAMGG INT CHECK (PHANTRAMGG >= 0 AND PHANTRAMGG <= 100),
	NGAYBD DATE NOT NULL,
	NGAYKT DATE NOT NULL,
	TRANGTHAI NVARCHAR(20) NOT NULL CHECK (TRANGTHAI IN (N'Hoạt động', N'Hết hạn'))
);
-- Thêm ràng buộc CHECK cho NGAYKT sau khi bảng đã được tạo
ALTER TABLE GIAMGIA
ADD CONSTRAINT CK_NGAYKT CHECK (NGAYKT >= NGAYBD);

--
CREATE TABLE HOADON
(
	MAHD INT IDENTITY (1,1) PRIMARY KEY,
	TENHD NVARCHAR(30) NOT NULL,
	NGAYLAP DATE NOT NULL DEFAULT GETDATE(),
	NGUOILAP NVARCHAR(30) NOT NULL,
	MAND INT NOT NULL,
	TONGTIEN MONEY CHECK (TONGTIEN >= 0), -- Tổng tiền không âm
	TRANGTHAI NVARCHAR(20) NOT NULL CHECK (TRANGTHAI IN (N'Đã thanh toán', N'Chưa thanh toán')), -- Trạng thái chỉ được "Đã thanh toán" hoặc "Chưa thanh toán"
	MAGG INT,
	CONSTRAINT FK_HOADON_NGUOIDUNG FOREIGN KEY (MAND) REFERENCES NGUOIDUNG(MAND),
	CONSTRAINT FK_HOADON_GIAMGIA FOREIGN KEY (MAGG) REFERENCES GIAMGIA(MAGG)
);
--
CREATE TABLE CHITIETHOADON
(
	MAHD INT NOT NULL, 
	MASP INT NOT NULL, 
	SOLUONG INT NOT NULL CHECK (SOLUONG > 0), -- Số lượng phải lớn hơn 0
	DONGIA MONEY NOT NULL CHECK (DONGIA > 0), -- Đơn giá phải lớn hơn 0
	THANHTIEN MONEY NOT NULL 
	CONSTRAINT PK_CHITIETHOADON PRIMARY KEY (MAHD, MASP),
	CONSTRAINT FK_CHITIETHOADON_HOADON FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD),
	CONSTRAINT FK_CHITIETHOADON_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);
--
CREATE TABLE NHACUNGCAP
(
	MANCC INT IDENTITY (1,1) PRIMARY KEY,
	TENNCC NVARCHAR(50) NOT NULL UNIQUE, -- Tên nhà cung cấp phải duy nhất
	DIACHI NVARCHAR(150),
	SDT VARCHAR(20) NOT NULL UNIQUE, -- Số điện thoại nhà cung cấp phải duy nhất
	EMAIL VARCHAR(30) NOT NULL UNIQUE, -- Email nhà cung cấp phải duy nhất
	NGUOILIENHE NVARCHAR(30)
);
--
CREATE TABLE PHIEUNHAP
(
    MAPN INT IDENTITY (1,1) PRIMARY KEY,
    MANCC INT NOT NULL,
    NGAYLAP DATE NOT NULL DEFAULT GETDATE(),
    TONGTIEN MONEY CHECK (TONGTIEN >= 0), -- Tổng tiền không âm
    TRANGTHAI NVARCHAR(50) NOT NULL CHECK (TRANGTHAI IN (N'Hoàn thành', N'Chưa hoàn thành')), -- Trạng thái chỉ được "Hoàn thành" hoặc "Chưa hoàn thành"
    CONSTRAINT FK_PHIEUNHAP_NHACUNGCAP FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP(MANCC)
);
--
CREATE TABLE CHITIETPHIEUNHAP
(
    MAPN INT NOT NULL,
    MASP INT NOT NULL,
    SOLUONG INT NOT NULL CHECK (SOLUONG > 0), 
    DONGIA MONEY NOT NULL CHECK (DONGIA > 0),
    THANHTIEN MONEY NOT NULL,
    CONSTRAINT PK_CTPHIEUNHAP PRIMARY KEY (MAPN, MASP),
    CONSTRAINT FK_CTPHIEUNHAP_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
	CONSTRAINT FK_CTPHIEUNHAP_PHIEUNHAP FOREIGN KEY (MAPN) REFERENCES PHIEUNHAP(MAPN)
);
--
DROP TABLE CHITIETPHIEUNHAP
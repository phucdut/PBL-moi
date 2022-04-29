-- Những bảng database cần có trong quản lý quán cafe
-- Khu vực(KHU_VUC)
-- Bàn(BAN)
-- Hóa đơn(HOA_DON_BAN_HANG)
-- Chi tiết hóa đơn(CHI_TIET_HD_BAN_HANG)
-- Nhân viên liên quan(quản lý nhân viên)(NHAN_VIEN)
-- Khách hàng của hóa đơn(quản lý khách hàng)(KHACH_HANG)
-- Chi tiết khách hàng(loại khách hàng)(LOAI_KHACH_HANG)
-- Hàng hóa(HANG_HOA)
-- Loại hàng hóa(đồ uống, thức ăn)(LOAI_HANG_HOA)

CREATE DATABASE PBL3
GO
USE PBL3
GO
CREATE TABLE KHU_VUC
(
    Ma_Khu_Vuc INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Ten_Khu_Vuc NVARCHAR(150) NOT NULL,
	Trang_Thai NVARCHAR(200)  -- ALLOW NULL
)
GO
-- Cấp phát dữ liệu cho Khu vực
INSERT INTO KHU_VUC(Ten_Khu_Vuc, Trang_Thai) values 
(N'Tầng 1',''),
(N'Tầng 2',''),
(N'Tầng 3','');
GO
SELECT *FROM dbo.KHU_VUC;
GO
CREATE TABLE BAN
(
    Ma_Ban INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Ten_Ban NVARCHAR(200) NOT NULL,
	Ma_Khu_Vuc INT NOT NULL,
    Tinh_Trang NVARCHAR(200) NOT NULL,
	CONSTRAINT fk_htk_Ma_Khu_Vuc FOREIGN KEY (Ma_Khu_Vuc) REFERENCES KHU_VUC (Ma_Khu_Vuc)
)
GO
-- THÊM dữ liệu cho data Bàn
INSERT INTO BAN(Ten_Ban, Ma_Khu_Vuc, Tinh_Trang) values  
(N'BÀN 01',1,N'Trống'),
(N'BÀN 02',1,N'Trống'),
(N'BÀN 03',1,N'Trống'),
(N'BÀN 04',1,N'Đã có khách'),
(N'BÀN 05',1,N'Trống'),
(N'BÀN 06',2,N'Trống'),
(N'BÀN 07',2,N'Đã có khách'),
(N'BÀN 08',2,N'Trống'),
(N'BÀN 09',2,N'Trống'),
(N'BÀN 10',2,N'Trống'),
(N'BÀN 11',3,N'Trống'),
(N'BÀN 12',3,N'Đã có khách'),
(N'BÀN 13',3,N'Đã có khách'),
(N'BÀN 14',3,N'Đã có khách');
GO
SELECT *FROM dbo.BAN;
GO

CREATE TABLE NHAN_VIEN
(
    Ma_Nhan_Vien INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Ten_Nhan_Vien NVARCHAR(200) NOT NULL,
	Gioi_Tinh NVARCHAR(50) NOT NULL,
	Chuc_Vu NVARCHAR(150) NOT NULL,
	Dia_Chi NVARCHAR(150) NOT NULL,
	SDT VARCHAR(50) NOT NULL,
	Phan_Quyen BIT NOT NULL,
	Mat_Khau VARCHAR(1000) NOT NULL,
)
GO
-- THÊM dữ liệu cho data Nhân Viên
INSERT INTO NHAN_VIEN(Ten_Nhan_Vien, Gioi_Tinh, Chuc_Vu, Dia_Chi, SDT, Phan_Quyen, Mat_Khau) values
  (N'Trần Văn Phúc',N'Nam',N'Quản lý',N'111 - Nguyễn Lương Bằng', '0311112222',1,'121212'),
  (N'Trần Tố Uyên',N'Nữ',N'Nhân Viên phục vụ',N'13 - Nguyễn Lương Bằng', '0987778835',0,'172929'),
  (N'Trần Hương Giang',N'Nữ',N'Nhân Viên lễ tân',N'15 - Nguyễn Lương Bằng', '0987748835',0,'142929'),
  (N'Trần Thanh Tú',N'Nữ',N'Nhân Viên lễ tân',N'16 - Nguyễn Lương Bằng', '0987772835',0,'173929'),
  (N'Trần Ngọc Anh',N'Nữ',N'Nhân Viên pha chế',N'18 - Nguyễn Lương Bằng', '0987771832',0,'175239'),
  (N'Nguyễn Bảo Nhi',N'Nữ',N'Nhân Viên phục vụ',N'113 - Nguyễn Lương Bằng', '0987778836',0,'171929'),
  (N'Trần Tuấn Anh',N'Nam',N'Nhân Viên phục vụ',N'138 - Nguyễn Lương Bằng', '0987754835',0,'172923'),
  (N'Lê Bảo Quốc',N'Nam',N'Nhân Viên pha chế',N'139 - Nguyễn Lương Bằng', '0987770835',0,'178929'),
  (N'Lê Hoàng Đức',N'Nam',N'Bảo vệ',N'153 - Nguyễn Lương Bằng', '0987778895',0,'172919'),
  (N'Đặng Trần Côn',N'Nam',N'Bảo vệ',N'138 - Nguyễn Lương Bằng', '0987771835',0,'072929'),
  (N'Trần Văn Hoàng',N'Nam',N'Nhân Viên phục vụ',N'1333 - Nguyễn Lương Bằng', '0987578863',0,'174921');

GO

SELECT *FROM dbo.NHAN_VIEN;
GO

CREATE TABLE LOAI_KHACH_HANG
(
    Ma_Loai_Khach_Hang INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Ten_Loai_Khach_Hang NVARCHAR(250) NOT NULL,
	Giam_gia INT NOT NULL
)
GO
-- THÊM dữ liệu cho data Loại Khách Hàng
INSERT INTO LOAI_KHACH_HANG( Ten_Loai_Khach_Hang, Giam_gia) values 
(N'Học sinh - Sinh viên', 10),
(N'Khách quen - Yêu thích cafe', 5),
(N'Lao động tự do', 0),
(N'Nhân viên văn phòng', 5);
GO

SELECT *FROM dbo.LOAI_KHACH_HANG;
GO

CREATE TABLE KHACH_HANG
(
    Ma_Khach_Hang INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Ma_Loai_Khach_Hang INT NOT NULL,  -- Khóa ngoại
	Ten_Khach_Hang NVARCHAR(200) NOT NULL,
	Dia_Chi NVARCHAR(250) NOT NULL,
	SDT VARCHAR(50) NOT NULL,
	Diem_Tich_Luy INT NOT NULL, -- ĐIỂM TÍCH LŨY KHI MUA HÀNG
	CONSTRAINT fk_htk_Ma_Loai_Khach_Hang FOREIGN KEY (Ma_Loai_Khach_Hang) REFERENCES LOAI_KHACH_HANG (Ma_Loai_Khach_Hang)
)
GO

INSERT INTO KHACH_HANG(Ma_Loai_Khach_Hang, Ten_Khach_Hang, Dia_Chi, SDT, Diem_Tich_Luy) values 
(1,N'Trần Văn Phúc', N'20 - Phan Rang', '0932345644', 2),
(2,N'Trần Văn Phước', N'20 - Điện Biên Phủ', '0936656424', 3),
(2,N'Lê Tùng Duy', N'28 - Điện Biên Phủ', '0932355654', 3),
(1,N'Hoàng Phước Dung', N'20 - Ngô Sĩ Liên', '0932545634', 0),
(3,N'Trần Bích Phương', N'05 - Ngô Sĩ Liên', '0932325461', 1),
(4,N'Đào Thị Bích Hằng', N'192 - Nguyễn Lương Bằng', '0932341248', 2),
(4,N'Nguyễn Phước Duy', N'120 - Điện Biên Phủ', '0932317598', 2),
(4,N'Phàm Ngọc Bích', N'222 - Phan Rang', '0932387692', 1),
(1,N'Huỳnh Như Sương', N'150 - Điện Biên Phủ', '0931578444', 1);

SELECT *FROM dbo.KHACH_HANG;
GO

CREATE TABLE LOAI_HANG_HOA
(
    Ma_Loai_Hang_Hoa INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Ten_Loai_Hang_Hoa NVARCHAR(150) NOT NULL,
	Mo_Ta NVARCHAR(150) 
)
GO
INSERT INTO LOAI_HANG_HOA(Ten_Loai_Hang_Hoa, Mo_Ta) values 
(N'Cafe',N'Loại đồ uống trọng tâm của Quán'),
(N'Nước ép',N'Loại đồ uống Phụ'),
(N'Sinh tố hoa quả',N'Loại đồ uống lành mạnh, tốt cho sức khỏe'),
(N'Trà lạnh & trà nóng',N'Loại đồ uống phù hợp với Thời tiết Lạnh - Giải nhiệt'),
(N'Sữa chua',N'Đồ uống tốt cho sức khỏe, giảm cân,...');
GO

SELECT *FROM dbo.LOAI_HANG_HOA;
GO

CREATE TABLE HANG_HOA
(
    Ma_Hang_Hoa INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Ten_Hang_Hoa NVARCHAR(150) NOT NULL,
	Ma_Loai_Hang_Hoa INT NOT NULL,-- KHÓA NGOẠI
	Hinh_Anh VARCHAR(50) NOT NULL,
	Gia_Hang_Hoa INT NOT NULL,
	CONSTRAINT fk_htk_Ma_Loai_Hang_Hoa FOREIGN KEY (Ma_Loai_Hang_Hoa) REFERENCES LOAI_HANG_HOA (Ma_Loai_Hang_Hoa)
)
GO
INSERT INTO HANG_HOA(Ten_Hang_Hoa, Ma_Loai_Hang_Hoa, Hinh_Anh, Gia_Hang_Hoa ) values
(N'Cà phê Mocha',1,'Cafemocha.jpg',120000),
(N'Caramel Macchiato',1,'Caramel.jpg',100000),
(N'Cà phê sữa lắc',1,'Cafesualac.jpg',15000),
(N'Cà phê tiramisu',1,'Tiramisu.jpg',100000),
(N'Cà phê Ireland',1,'Ireland.jpg',50000),
(N'Cà phê sữa chua',1,'Cafesuachua.jpg',50000),
(N'Cà phê sữa đá',1,'Cafesuada.jpg',20000),
(N'Cappuccino',1,'Cappuccino.jpg',89000),
(N'Marocchino',1,'Marocchino.jpg',89000),
(N'Nước ép dưa hấu',2,'Nuocepduahau.jpg',15000),
(N'Nước ép táo',2,'Nuoceptao.jpg',15000),
(N'Nước ép cam',2,'Nuocepcam.jpg',20000),
(N'Nước ép thanh long',2,'Nuocepthanhlong.jpg',20000),
(N'Nước ép thơm',2,'Nuocepthom.jpg',25000),
(N'Sinh tố dâu tây',3,'Sinhtodautay.jpg',35000),
(N'Sinh tố lê',3,'Sinhtole.jpg',25000),
(N'Sinh tố đào',3,'Sinhtodao.jpg',25000),
(N'Sinh tố thơm',3,'Sinhtothơm.jpg',25000),
(N'Trà lạnh',4,'Tralanh.jpg',55000),
(N'Trà trái cây',4,'Tratraicay.jpg',55000),
(N'Trà hoa cúc mật ong',4,'Trahoacucmatong.jpg',55000),
(N'Trà quế mật ong',4,'Traquematong.jpg',45000),
(N'Sữa chua nếp cẩm',5,'Suachuanepcam.jpg',35000),
(N'Sữa chua dẻo thạch trái cây',5,'Suachuathachtraicay.jpg',89000),
(N'Sữa chua vị lá dứa',5,'Suachualadua.jpg',28000);
GO
SELECT *FROM dbo.HANG_HOA;
GO

CREATE TABLE HOA_DON_BAN_HANG
(
    Ma_Hoa_Don INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Ma_Nhan_Vien INT NOT NULL,-- KHÓA NGOẠI
	Ma_Ban INT NOT NULL,-- KHÓA NGOẠI
	Ma_Khach_Hang INT,-- ALLOW NULL VÀ LÀ KHÓA NGOẠI
	Date_HDBH DATETIME NOT NULL,
	Tong_Tien FLOAT NOT NULL,
	Diem_Tich_Luy INT,-- ALLOW NULL
	Giam_Gia INT,-- ALLOW NULL
	CONSTRAINT fk_hdbh_Ma_Nhan_Vien FOREIGN KEY (Ma_Nhan_Vien) REFERENCES NHAN_VIEN (Ma_Nhan_Vien),
	CONSTRAINT fk_hdbh_Ma_Ban FOREIGN KEY (Ma_Ban) REFERENCES BAN (Ma_Ban),
    CONSTRAINT fk_hdbh_Ma_Khach_Hang FOREIGN KEY (Ma_Khach_Hang) REFERENCES KHACH_HANG (Ma_Khach_Hang)
)
GO

INSERT INTO HOA_DON_BAN_HANG(Ma_Nhan_Vien, Ma_Ban, Ma_Khach_Hang, Date_HDBH, Tong_Tien, Diem_Tich_Luy, Giam_Gia) values 
(2,3,1,'2022-04-25 07:35:24',135000, 3, 10),
(3,2,2,'2022-04-25 08:30:20',190000, 4, 5),
(2,1,3,'2022-04-25 08:35:24',274550, 4, 5),
(2,8,4,'2022-04-25 09:30:25',90000, 1, 10),
(3,8,5,'2022-04-25 10:35:24',300000, 2, 0),
(2,4,6,'2022-04-25 10:45:30',237500, 3, 5),
(3,13,7,'2022-04-25 11:00:24',14250, 3, 5),
(3,10,8,'2022-04-25 11:35:24',19000, 2, 5),
(3,11,9,'2022-04-25 13:32:11',135000, 2, 10);
GO
SELECT *FROM dbo.HOA_DON_BAN_HANG;
GO

CREATE TABLE CHI_TIET_HD_BAN_HANG
(
    Ma_CTHD INT PRIMARY KEY IDENTITY (1,1) NOT NULL,-- MÃ CHI TIẾT HÓA ĐƠN BÁN HÀNG TẠI CHỖ
    Ma_Hoa_Don INT NOT NULL,-- KHÓA NGOẠI
	Ma_Hang_Hoa INT NOT NULL,-- KHÓA NGOẠI
	So_Luong INT NOT NULL,
	CONSTRAINT fk_hdbh_Ma_Ma_Hoa_Don FOREIGN KEY (Ma_Hoa_Don) REFERENCES HOA_DON_BAN_HANG (Ma_Hoa_Don),
	CONSTRAINT fk_hdbh_Ma_Hang_Hoa FOREIGN KEY (Ma_Hang_Hoa) REFERENCES HANG_HOA (Ma_Hang_Hoa)
)
GO
--INSERT INTO CT_HDBH_TAI_CHO(Ma_CTHD, Ma_Hoa_Don, Ma_Hang_Hoa, So_Luong) values 
INSERT INTO CHI_TIET_HD_BAN_HANG(Ma_Hoa_Don, Ma_Hang_Hoa, So_Luong) values 
(1, 2, 1),
(1, 5, 1),
(2, 2, 1),
(2, 4, 1),
(3, 2, 1),
(3, 4, 1),
(3, 8, 1),
(4, 2, 1),
(5, 4, 3),
(6, 18, 4),
(7, 15, 1),
(8, 13, 1),
(9, 5, 1),
(9, 6, 1),
(9, 16, 1),
(9, 17, 1);
SELECT *FROM dbo.CHI_TIET_HD_BAN_HANG;
GO

-- TRUY VẤN SQL hiển thị loại đồ uống theo danh mục
-- Muốn hiển thị loại đồ uống, đồ uống và giá tiền:
SELECT LOAI_HANG_HOA.Ten_Loai_Hang_Hoa, HANG_HOA.Ten_Hang_Hoa, HANG_HOA.Gia_Hang_Hoa
FROM LOAI_HANG_HOA, HANG_HOA
WHERE LOAI_HANG_HOA.Ma_Loai_Hang_Hoa = HANG_HOA.Ma_Loai_Hang_Hoa
AND LOAI_HANG_HOA.Ma_Loai_Hang_Hoa = 1


CREATE PROC PROC_XEM_MENU_THEO_DANH_MUC_Hang_Hoa
    @Ma_Loai_Hang_Hoa INT
AS
BEGIN
      SELECT LOAI_HANG_HOA.Ten_Loai_Hang_Hoa, HANG_HOA.Ten_Hang_Hoa, HANG_HOA.Gia_Hang_Hoa
      FROM LOAI_HANG_HOA, HANG_HOA
      WHERE LOAI_HANG_HOA.Ma_Loai_Hang_Hoa = HANG_HOA.Ma_Loai_Hang_Hoa
          AND LOAI_HANG_HOA.Ma_Loai_Hang_Hoa = @Ma_Loai_Hang_Hoa
END

EXEC PROC_XEM_MENU_THEO_DANH_MUC_Hang_Hoa 3

--- HIỂN THỊ danh mục đồ uống trong 1 đơn hàng
-- Ma_Hoa_Don,Ten_Nhan_Vien,Ten_Khach_Hang, Ten_hang_hoa,giá, số lượng, tổng tiền, ngày mua
--- dữ liệu từ Bảng Hóa đơn, Nhân viên, khách hàng, hàng hóa,chi tiết hóa đơn
SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HANG_HOA.Ten_Hang_Hoa,HANG_HOA.Gia_Hang_Hoa,CHI_TIET_HD_BAN_HANG.So_Luong,HOA_DON_BAN_HANG.Tong_Tien,HOA_DON_BAN_HANG.Date_HDBH
FROM HOA_DON_BAN_HANG,NHAN_VIEN,KHACH_HANG,HANG_HOA,CHI_TIET_HD_BAN_HANG
WHERE HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
   AND HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
   AND HOA_DON_BAN_HANG.Ma_Nhan_Vien = NHAN_VIEN.Ma_Nhan_Vien
   AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa

-- XEM ĐƠN HÀNG THEO MÃ HÓA ĐƠN
CREATE PROC PROC_XEM_HOA_DON
    @Ma_Hoa_Don INT
AS
BEGIN
      SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HANG_HOA.Ten_Hang_Hoa,HANG_HOA.Gia_Hang_Hoa,CHI_TIET_HD_BAN_HANG.So_Luong,HOA_DON_BAN_HANG.Tong_Tien,HOA_DON_BAN_HANG.Date_HDBH
FROM HOA_DON_BAN_HANG,NHAN_VIEN,KHACH_HANG,HANG_HOA,CHI_TIET_HD_BAN_HANG
WHERE HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
   AND HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
   AND HOA_DON_BAN_HANG.Ma_Nhan_Vien = NHAN_VIEN.Ma_Nhan_Vien
   AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa
   AND HOA_DON_BAN_HANG.Ma_Hoa_Don = @Ma_Hoa_Don
END

EXEC PROC_XEM_HOA_DON 9

-- XEM ĐƠN HÀNG THEO MÃ KHÁCH HÀNG
CREATE PROC PROC_XEM_HOA_DON_THEO_MA_KH_
    @Ma_Khach_Hang INT
AS
BEGIN
      SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HANG_HOA.Ten_Hang_Hoa,HANG_HOA.Gia_Hang_Hoa,CHI_TIET_HD_BAN_HANG.So_Luong,HOA_DON_BAN_HANG.Tong_Tien,HOA_DON_BAN_HANG.Date_HDBH
FROM HOA_DON_BAN_HANG,NHAN_VIEN,KHACH_HANG,HANG_HOA,CHI_TIET_HD_BAN_HANG
WHERE HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
   AND HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
   AND HOA_DON_BAN_HANG.Ma_Nhan_Vien = NHAN_VIEN.Ma_Nhan_Vien
   AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa
   AND KHACH_HANG.Ma_Khach_Hang = @Ma_Khach_Hang
END

EXEC PROC_XEM_HOA_DON_THEO_MA_KH_ 1

-- TRUY VẤN HIỂN THỊ DOANH THU TỪ NGÀY - ĐẾN NGÀY
-- thống kê doanh thu
SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HANG_HOA.Ten_Hang_Hoa,HANG_HOA.Gia_Hang_Hoa,CHI_TIET_HD_BAN_HANG.So_Luong,HOA_DON_BAN_HANG.Tong_Tien,HOA_DON_BAN_HANG.Date_HDBH
FROM HOA_DON_BAN_HANG,NHAN_VIEN,KHACH_HANG,HANG_HOA,CHI_TIET_HD_BAN_HANG
WHERE HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
   AND HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
   AND HOA_DON_BAN_HANG.Ma_Nhan_Vien = NHAN_VIEN.Ma_Nhan_Vien
   AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa
   AND HOA_DON_BAN_HANG.Date_HDBH >= '2022-04-25'
   AND HOA_DON_BAN_HANG.Date_HDBH <= '2022-04-30'

-- hiển thị hoanh thu
SELECT Tong_Tien
FROM HOA_DON_BAN_HANG
WHERE HOA_DON_BAN_HANG.Date_HDBH >= '2022-04-25'
   AND HOA_DON_BAN_HANG.Date_HDBH <= '2022-04-30'

-- HIỂN THỊ TỔNG DOANH THU
SELECT SUM(Tong_Tien) 'Tong_Doanh_Thu'
FROM HOA_DON_BAN_HANG
WHERE HOA_DON_BAN_HANG.Date_HDBH >= '2022-04-25'
   AND HOA_DON_BAN_HANG.Date_HDBH <= '2022-04-30'

CREATE PROC PROC_XEM_TONG_DOANH_THU
    @StartDate DATE,
	@EndDate DATE
AS
BEGIN
    SELECT SUM(Tong_Tien) 'Tong_Doanh_Thu'
    FROM HOA_DON_BAN_HANG
    WHERE HOA_DON_BAN_HANG.Date_HDBH >= @StartDate
      AND HOA_DON_BAN_HANG.Date_HDBH <= @EndDate
END

EXEC PROC_XEM_TONG_DOANH_THU '2022-04-25','2022-04-30'


-- Tính tổng tiền của từng đơn hàng.
-- Bao gồm: Mã đơn hàng, Tên nhân viên, Tên Khách hàng, Ngày mua, Tổng tiền
SELECT HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HOA_DON_BAN_HANG.Date_HDBH 'Ngay mua',SUM(CHI_TIET_HD_BAN_HANG.So_Luong * HANG_HOA.Gia_Hang_Hoa) 'Tong Tien'
FROM HOA_DON_BAN_HANG, NHAN_VIEN, KHACH_HANG, CHI_TIET_HD_BAN_HANG, HANG_HOA
WHERE HOA_DON_BAN_HANG.Ma_Khach_Hang = KHACH_HANG.Ma_Khach_Hang
  AND NHAN_VIEN.Ma_Nhan_Vien = HOA_DON_BAN_HANG.Ma_Nhan_Vien
  AND HOA_DON_BAN_HANG.Ma_Hoa_Don = CHI_TIET_HD_BAN_HANG.Ma_Hoa_Don
  AND CHI_TIET_HD_BAN_HANG.Ma_Hang_Hoa = HANG_HOA.Ma_Hang_Hoa
GROUP BY HOA_DON_BAN_HANG.Ma_Hoa_Don, NHAN_VIEN.Ten_Nhan_Vien, KHACH_HANG.Ten_Khach_Hang, HOA_DON_BAN_HANG.Date_HDBH
GO
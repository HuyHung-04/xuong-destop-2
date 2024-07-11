create database DUAN_1
go
use DUAN_1
go
create table KhachHang(
ID_KhachHang int identity(1,1) primary key,
MaKhachHang varchar(10),
TenKhachHang nvarchar(100),
SoDienThoai varchar(10),
DiaChi nvarchar(50),
TrangThai bit
)
go
create table Voucher(
ID_Voucher int identity(1,1) primary key,
MaVoucher varchar(10),
TenVoucher nvarchar(100),
PhanTramGiamGia nvarchar(50),
NgayBatDau date,
NgayKetThuc date,
TrangThai bit
)
go
create table NhanVien(
ID_NhanVien int identity(1,1) primary key,
MaNhanVien varchar(10),
TenNhanVien nvarchar(100),
TenDangNhap nvarchar(50),
MatKhau nvarchar(50),
Email varchar(50),
SoDienThoai varchar(10),
ChucVu nvarchar(50),
TrangThai bit
)
go
create table HoaDon(
ID_HoaDon int identity(1,1) primary key,
ID_KhachHang int foreign key references KhachHang(ID_KhachHang),
ID_Voucher int foreign key references Voucher(ID_Voucher),
ID_NhanVien int foreign key references NhanVien(ID_NhanVien),
TongTien float,
NgayTao date,
TrangThai bit
)
go
create table ChiTietHoaDon(
ID_ChiTietHoaDon int identity(1,1) primary key,
ID_HoaDon int foreign key references HoaDon(ID_HoaDon),
ID_SanPhamChiTiet int foreign key references SanPhamChiTiet(ID_SanPhamChiTiet),
SoLuong int,
Gia float,
TrangThai bit
)
go
create table SanPham(
ID_SanPham int identity(1,1) primary key,
MaSanPham varchar(10),
TenSanPham nvarchar(100),
TrangThai bit,
ID_NhaCungCap int foreign key references NhaCungCap(ID_NhaCungCap),
ID_DanhMucSanPham int foreign key references DanhMucSanPham(ID_DanhMuc)
)
go
create table SanPhamChiTiet(
ID_SanPhamChiTiet int identity(1,1) primary key,
ID_SanPham int foreign key references SanPham(ID_SanPham),
ID_Mau int foreign key references Mau(ID_Mau),
ID_Size int foreign key references Size(ID_Size),
ID_GiamGia int foreign key references GiamGia(ID_GiamGia),
ID_ChatLieu int foreign key references ChatLieu(ID_ChatLieu),
ID_DeGiay int foreign key references DeGiay(ID_DeGiay),
MaSanPhamChiTiet varchar(10),
TenSanPham nvarchar(100),
ThuongHieu nvarchar(50),
Gia float,
SoLuong int,
TrangThai bit
)
go
create table NhaCungCap(
ID_NhaCungCap int identity(1,1) primary key,
TenNhaCungCap nvarchar(100),
Email varchar(50),
SoDienThoai varchar(10),
DiaChi nvarchar(100),
TrangThai bit
)
go
create table DanhMucSanPham(
ID_DanhMuc int identity(1,1) primary key,
MaDanhMuc varchar(10),
TenDanhMuc nvarchar(100),
TrangThai bit
)
go
create table Mau(
ID_Mau int identity(1,1) primary key,
MaMau varchar(10),
TenMau nvarchar(100),
TrangThai bit
)
go
create table Size(
ID_Size int identity(1,1) primary key,
MaSize varchar(10),
TenSize nvarchar(100),
TrangThai bit
)
go
create table GiamGia(
ID_GiamGia int identity(1,1) primary key,
MaGiamGia varchar(10),
PhanTramGiamGia float,
NgayBatDau date,
NgayKetThuc date,
TrangThai bit
)
go
create table ChatLieu(
ID_ChatLieu int identity(1,1) primary key,
MaChatLieu varchar(10),
TenChatLieu nvarchar(100),
TrangThai bit
)
go
create table DeGiay(
ID_DeGiay int identity(1,1) primary key,
MaDeGiay varchar(10),
TenDeGiay nvarchar(100),
TrangThai bit
)
select * from NhanVien
-- Inserting data into KhachHang
insert into KhachHang (MaKhachHang, TenKhachHang, SoDienThoai, DiaChi, TrangThai)
values
('KH001', N'Nguyen Van A', '0123456789', N'Ha Noi', 1),
('KH002', N'Tran Thi B', '0987654321', N'Hai Phong', 1),
('KH003', N'Le Van C', '0912345678', N'Da Nang', 1),
('KH004', N'Pham Thi D', '0908765432', N'Ho Chi Minh', 1),
('KH005', N'Do Van E', '0934567890', N'Can Tho', 1);
go

-- Inserting data into Voucher
insert into Voucher (MaVoucher, TenVoucher, PhanTramGiamGia, NgayBatDau, NgayKetThuc, TrangThai)
values
('VC001', N'Giam gia 10%', 10, '2024-01-01', '2024-12-31', 1),
('VC002', N'Giam gia 20%', 20, '2024-01-01', '2024-12-31', 1),
('VC003', N'Giam gia 30%', 30, '2024-01-01', '2024-12-31', 1),
('VC004', N'Giam gia 40%', 40, '2024-01-01', '2024-12-31', 1),
('VC005', N'Giam gia 50%', 50, '2024-01-01', '2024-12-31', 1);
go

-- Inserting data into NhanVien
insert into NhanVien (MaNhanVien, TenNhanVien, TenDangNhap, MatKhau, Email, SoDienThoai, ChucVu, TrangThai)
values
('NV001', N'Nguyen Van F', 'nvf', 'password', 'nvf@example.com', '0912345678', N'Quan ly', 1),
('NV002', N'Tran Thi G', 'ttg', 'password', 'ttg@example.com', '0908765432', N'Nhan vien', 1),
('NV003', N'Le Van H', 'lvh', 'password', 'lvh@example.com', '0934567890', N'Nhan vien', 1),
('NV004', N'Pham Thi I', 'pti', 'password', 'pti@example.com', '0923456789', N'Nhan vien', 1),
('NV005', N'Do Van J', 'dvj', 'password', 'dvj@example.com', '0912345679', N'Quan ly', 1);
go

-- Inserting data into NhaCungCap
insert into NhaCungCap (TenNhaCungCap, Email, SoDienThoai, DiaChi, TrangThai)
values
(N'Cong ty A', 'cta@example.com', '0912345670', N'Ha Noi', 1),
(N'Cong ty B', 'ctb@example.com', '0908765431', N'Hai Phong', 1),
(N'Cong ty C', 'ctc@example.com', '0934567880', N'Da Nang', 1),
(N'Cong ty D', 'ctd@example.com', '0923456779', N'Ho Chi Minh', 1),
(N'Cong ty E', 'cte@example.com', '0912345669', N'Can Tho', 1);
go

-- Inserting data into DanhMucSanPham
insert into DanhMucSanPham (MaDanhMuc, TenDanhMuc, TrangThai)
values
('DM001', N'Giay da banh', 1),
('DM002', N'Giay chay bo', 1),
('DM003', N'Giay the thao', 1),
('DM004', N'Giay tay', 1),
('DM005', N'Giay dep', 1);
go

-- Inserting data into Mau
insert into Mau (MaMau, TenMau, TrangThai)
values
('M001', N'Do', 1),
('M002', N'Xanh', 1),
('M003', N'Vang', 1),
('M004', N'Trang', 1),
('M005', N'Den', 1);
go

-- Inserting data into Size
insert into Size (MaSize, TenSize, TrangThai)
values
('S001', N'39', 1),
('S002', N'40', 1),
('S003', N'41', 1),
('S004', N'42', 1),
('S005', N'43', 1);
go

-- Inserting data into GiamGia
insert into GiamGia (MaGiamGia, PhanTramGiamGia, NgayBatDau, NgayKetThuc, TrangThai)
values
('GG001', 5, '2024-01-01', '2024-12-31', 1),
('GG002', 10, '2024-01-01', '2024-12-31', 1),
('GG003', 15, '2024-01-01', '2024-12-31', 1),
('GG004', 20, '2024-01-01', '2024-12-31', 1),
('GG005', 25, '2024-01-01', '2024-12-31', 1);
go

-- Inserting data into ChatLieu
insert into ChatLieu (MaChatLieu, TenChatLieu, TrangThai)
values
('CL001', N'Vai', 1),
('CL002', N'Da', 1),
('CL003', N'Nhua', 1),
('CL004', N'Cotton', 1),
('CL005', N'Synhetic', 1);
go

-- Inserting data into DeGiay
insert into DeGiay (MaDeGiay, TenDeGiay, TrangThai)
values
('DG001', N'Cao su', 1),
('DG002', N'Nhua', 1),
('DG003', N'Vai', 1),
('DG004', N'Synhetic', 1),
('DG005', N'Cotton', 1);
go

-- Inserting data into SanPham
insert into SanPham (MaSanPham, TenSanPham, TrangThai, ID_NhaCungCap, ID_DanhMucSanPham)
values
('SP001', N'Giay Nike A', 1, 1, 1),
('SP002', N'Giay Nike B', 1, 2, 2),
('SP003', N'Giay Nike C', 1, 3, 3),
('SP004', N'Giay Nike D', 1, 4, 4),
('SP005', N'Giay Nike E', 1, 5, 5);
go

-- Inserting data into SanPhamChiTiet
insert into SanPhamChiTiet (ID_SanPham, ID_Mau, ID_Size, ID_GiamGia, ID_ChatLieu, ID_DeGiay, MaSanPhamChiTiet, TenSanPham, ThuongHieu, Gia, SoLuong, TrangThai)
values
(1, 1, 1, 1, 1, 1, 'SPCT001', N'Giay Nike A - Do - Size 39', N'Nike', 1000, 10, 1),
(2, 2, 2, 2, 2, 2, 'SPCT002', N'Giay Nike B - Xanh - Size 40', N'Nike', 1100, 15, 1),
(3, 3, 3, 3, 3, 3, 'SPCT003', N'Giay Nike C - Vang - Size 41', N'Nike', 1200, 20, 1),
(4, 4, 4, 4, 4, 4, 'SPCT004', N'Giay Nike D - Trang - Size 42', N'Nike', 1300, 25, 1),
(5, 5, 5, 5, 5, 5, 'SPCT005', N'Giay Nike E - Den - Size 43', N'Nike', 1400, 30, 1);
go
select * from SanPhamChiTiet
-- Inserting data into HoaDon
insert into HoaDon (ID_KhachHang, ID_Voucher, ID_NhanVien, TongTien, NgayTao, TrangThai)
values
(1, 1, 1, 1500, '2024-07-01', 1),
(2, 2, 2, 1600, '2024-07-02', 1),
(3, 3, 3, 1700, '2024-07-03', 1),
(4, 4, 4, 1800, '2024-07-04', 1),
(5, 5, 5, 1900, '2024-07-05', 1);
go

-- Inserting data into ChiTietHoaDon
insert into ChiTietHoaDon (ID_HoaDon, ID_SanPhamChiTiet, SoLuong, Gia, TrangThai)
values
(1, 1, 2, 2000, 1),
(2, 2, 3, 3000, 1),
(3, 3, 4, 4000, 1),
(4, 4, 5, 5000, 1),
(5, 5, 6, 6000, 1);
go



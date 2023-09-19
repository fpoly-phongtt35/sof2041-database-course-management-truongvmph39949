CREATE DATABASE SOF2041_Lap3
GO

USE SOF2041_Lap3
GO

CREATE TABLE NhanVien(
maNV NVARCHAR(50) primary key,
matKhau NVARCHAR(50),
hoTen NVARCHAR(50),
vaiTro bit 
)

CREATE TABLE ChuyenDe(
maCD NVARCHAR(50) primary key,
tenCD NVARCHAR(50),
hocPhi float,
thoiLuong int,
hinh NVARCHAR(50),
moTa NVARCHAR(100)
)

CREATE TABLE KhoaHoc(
maKH INT IDENTITY(1,1) PRIMARY KEY,
maCD NVARCHAR(50) not null,
hocPhi float,
thoiLuong int,
ngayKhaiGiang date,
ghiChu NVARCHAR(50),
maNV NVARCHAR(50) NOT null,
ngayTao Date,
CONSTRAINT FK_KH_CD FOREIGN KEY(maCD) references ChuyenDe(maCD),
CONSTRAINT FK_KH_NV FOREIGN KEY(maNV) references NhanVien(maNV)
)

CREATE TABLE NguoiHoc(
maNH NVARCHAR(50) primary key,
matKhau NVARCHAR(50),
hoTen NVARCHAR(50),
gioiTinh bit,
ngaySinh date,
email NVARCHAR(50),
soDienThoai NVARCHAR(50),
ghiChu NVARCHAR(50),
maNV NVARCHAR(50) NOT null,
CONSTRAINT FK_NH_NV FOREIGN KEY(maNV) references NhanVien(maNV),
ngayDK date
)
CREATE TABLE HocVien(
maHV INT IDENTITY(1,1) PRIMARY KEY,
maKH INT  not null,
maNH NVARCHAR(50) not null,
CONSTRAINT FK_HV_KH FOREIGN KEY(maKH) references KhoaHoc(maKH),
CONSTRAINT FK_HV_NH FOREIGN KEY(maNH) references NguoiHoc(maNH),
diem float
)

INSERT INTO NhanVien VALUES
('truongvmph39949','ninja64652',N'Vũ Mạnh Trường',1),
('huyvq','daotaotre1',N'Vũ Quang Huy',0),
('bangdx','grapdonngay2',N'Đoàn Xuân Bằng',0)

INSERT INTO ChuyenDe VALUES
('CD01',N'Lập trình Java',15000,72,'cd1.jpg',N'Ok'),
('CD02',N'Lập trình PHP',27000,65,'cd2.jpg',N'Ok'),
('CD03',N'Lập trình C#',54000,96,'cd3.jpg',N'Ok')
CREATE DATABASE QuanLyGara
GO

USE QuanLyGara
GO

--Xe
--ThamSo
--HieuXe
--PhuTung
--CT_PhieuSuaChua
--PhieuSuaChua
--TienCong
--BaoCaoTon
--PhieuThuTien
--BaoCaoDoanhSo
--CT_BCDoanhSo

CREATE TABLE HIEUXE
(
 HieuXe NVARCHAR(20) PRIMARY KEY NOT NULL
);
GO
CREATE TABLE XE
(
  BienSo NVARCHAR(20) PRIMARY KEY,
  TenChuXe NVARCHAR(20) NOT NULL,
  HieuXe NVARCHAR(20) NOT NULL,
  DiaChi NVARCHAR(20) NOT NULL,
  DienThoai INT NOT NULL,
  NgayTiepNhan DATETIME NOT NULL

  FOREIGN KEY(HieuXe) REFERENCES HIEUXE(HieuXe)
);
GO

CREATE TABLE THAMSO
(
 SoXeSuaToiDa INT
);
GO


CREATE TABLE TIENCONG
(
	NoiDung NVARCHAR(20)  PRIMARY KEY NOT NULL,
	TienCong FLOAT
);
GO
CREATE TABLE PHIEUSUACHUA
(
	SoPSC INT PRIMARY KEY NOT NULL,
	BienSo NVARCHAR(20),
	NgaySuaChua DATE, 
	TongTien FLOAT

	FOREIGN KEY (BienSo) REFERENCES XE(BienSo)
);
GO
CREATE TABLE PHUTUNG
(
	MaVTPT INT PRIMARY KEY NOT NULL,
	SoLuongTon INT,
	DonGia FLOAT,

);
GO
CREATE TABLE CT_PHIEUSUACHUA
(
	MaCT INT PRIMARY KEY NOT NULL,
	SoPSC INT,
	NoiDung NVARCHAR(20),
	TenCong FLOAT, 
	MaVTPT INT, 
	SoLuong INT, 
	DonGia FLOAT, 
	ThanhTien FLOAT,

	FOREIGN KEY (MaVTPT) REFERENCES PHUTUNG(MaVTPT),
	FOREIGN KEY(SoPSC) REFERENCES PHIEUSUACHUA(SoPSC),
	FOREIGN KEY(NoiDung) REFERENCES TIENCONG(NoiDung)
);
GO





CREATE TABLE BAOCAOTON
(
	Thang INT  NOT NULL,
	Nam INT  NOT NULL,
	MaVTPT INT, 
	TonDau INT, 
	TonCuoi INT,
	PhatSinh INT,
	PRIMARY KEY (Thang, Nam),
	FOREIGN KEY (MaVTPT) REFERENCES PHUTUNG(MaVTPT)
);
GO

CREATE TABLE PHIEUTHUTIEN
(
	 SoPhieu INT IDENTITY PRIMARY KEY NOT NULL,
	 BienSo NVARCHAR(20),
	 NgayThu DATE,
	 SoTienThu FLOAT

	 FOREIGN KEY (BienSo) REFERENCES XE(BienSo)
);
GO

CREATE TABLE BAOCAODOANHSO
(
	MaBC INT PRIMARY KEY NOT NULL,
	Thang INT,
	Nam INT,
	TongDoanhThu FLOAT, 
	
);
GO

CREATE TABLE CT_BCDoanhSo
(
	MaCT INT IDENTITY PRIMARY KEY NOT NULL,
	MaBC INT,
	HieuXe NVARCHAR(20),
	SoLuotSua INT,
	ThanhTien FLOAT, 
	TiLe FLOAT
	FOREIGN KEY (MaBC) REFERENCES BAOCAODOANHSO(MaBC)
);
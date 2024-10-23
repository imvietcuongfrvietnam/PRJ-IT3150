-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: qldaotao
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bangdiem`
--

DROP TABLE IF EXISTS `bangdiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangdiem` (
  `MSSV` char(8) NOT NULL,
  `MaMH` varchar(8) NOT NULL,
  `DiemKT` decimal(4,2) DEFAULT NULL,
  `DiemThang4` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`MSSV`,`MaMH`),
  KEY `MaMH` (`MaMH`),
  CONSTRAINT `bangdiem_ibfk_1` FOREIGN KEY (`MSSV`) REFERENCES `lylichsinhvien` (`MSSV`),
  CONSTRAINT `bangdiem_ibfk_2` FOREIGN KEY (`MaMH`) REFERENCES `monhoc` (`MaMon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangdiem`
--

LOCK TABLES `bangdiem` WRITE;
/*!40000 ALTER TABLE `bangdiem` DISABLE KEYS */;
/*!40000 ALTER TABLE `bangdiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bangiamhieu`
--

DROP TABLE IF EXISTS `bangiamhieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangiamhieu` (
  `MaTruong` varchar(8) NOT NULL,
  `MaCanBo` varchar(16) NOT NULL,
  `ChucVu` varchar(64) NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `MaTruong` (`MaTruong`),
  CONSTRAINT `bangiamhieu_ibfk_1` FOREIGN KEY (`MaTruong`) REFERENCES `truong` (`MaTruong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangiamhieu`
--

LOCK TABLES `bangiamhieu` WRITE;
/*!40000 ALTER TABLE `bangiamhieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `bangiamhieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctdt`
--

DROP TABLE IF EXISTS `ctdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctdt` (
  `MaCTDT` varchar(8) NOT NULL,
  `MaKhoa` varchar(16) NOT NULL,
  `TenCTDT` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TongSoTinChi` int NOT NULL,
  `NamBatDau` date NOT NULL,
  PRIMARY KEY (`MaCTDT`),
  KEY `MaKhoa` (`MaKhoa`),
  CONSTRAINT `ctdt_ibfk_1` FOREIGN KEY (`MaKhoa`) REFERENCES `khoa` (`MaKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctdt`
--

LOCK TABLES `ctdt` WRITE;
/*!40000 ALTER TABLE `ctdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctdt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dangkihocphan`
--

DROP TABLE IF EXISTS `dangkihocphan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dangkihocphan` (
  `SoTinChi` int NOT NULL,
  `MaMon` varchar(8) NOT NULL,
  `MSSV` char(8) NOT NULL,
  `Ki` varchar(8) NOT NULL,
  PRIMARY KEY (`MaMon`,`MSSV`,`Ki`),
  KEY `MSSV` (`MSSV`),
  KEY `Ki` (`Ki`),
  CONSTRAINT `dangkihocphan_ibfk_1` FOREIGN KEY (`MaMon`) REFERENCES `monhoc` (`MaMon`),
  CONSTRAINT `dangkihocphan_ibfk_2` FOREIGN KEY (`MSSV`) REFERENCES `lylichsinhvien` (`MSSV`),
  CONSTRAINT `dangkihocphan_ibfk_3` FOREIGN KEY (`Ki`) REFERENCES `kyhoc` (`Ki`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dangkihocphan`
--

LOCK TABLES `dangkihocphan` WRITE;
/*!40000 ALTER TABLE `dangkihocphan` DISABLE KEYS */;
/*!40000 ALTER TABLE `dangkihocphan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dssv_lophoc`
--

DROP TABLE IF EXISTS `dssv_lophoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dssv_lophoc` (
  `MaLop` varchar(10) NOT NULL,
  `MSSV` char(8) NOT NULL,
  `DQT` decimal(4,2) DEFAULT NULL,
  `DCK` decimal(4,2) DEFAULT NULL,
  `DTK` decimal(4,2) DEFAULT NULL,
  KEY `MaLop` (`MaLop`),
  KEY `MSSV` (`MSSV`),
  CONSTRAINT `dssv_lophoc_ibfk_1` FOREIGN KEY (`MaLop`) REFERENCES `lophoc` (`MaLop`),
  CONSTRAINT `dssv_lophoc_ibfk_2` FOREIGN KEY (`MSSV`) REFERENCES `lylichsinhvien` (`MSSV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dssv_lophoc`
--

LOCK TABLES `dssv_lophoc` WRITE;
/*!40000 ALTER TABLE `dssv_lophoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `dssv_lophoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giangvien`
--

DROP TABLE IF EXISTS `giangvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giangvien` (
  `MaGV` varchar(10) NOT NULL,
  `TenGV` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NamSinh` date NOT NULL,
  `QueQuan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(255) NOT NULL,
  `SDT` varchar(20) NOT NULL,
  `MaKhoa` varchar(16) NOT NULL,
  `CMND` varchar(20) NOT NULL,
  PRIMARY KEY (`MaGV`),
  KEY `MaKhoa` (`MaKhoa`),
  CONSTRAINT `giangvien_ibfk_1` FOREIGN KEY (`MaKhoa`) REFERENCES `khoa` (`MaKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giangvien`
--

LOCK TABLES `giangvien` WRITE;
/*!40000 ALTER TABLE `giangvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `giangvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gv_dugiang`
--

DROP TABLE IF EXISTS `gv_dugiang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gv_dugiang` (
  `MaGV` varchar(10) NOT NULL,
  `MaLop` varchar(10) NOT NULL,
  KEY `MaGV` (`MaGV`),
  KEY `MaLop` (`MaLop`),
  CONSTRAINT `gv_dugiang_ibfk_1` FOREIGN KEY (`MaGV`) REFERENCES `giangvien` (`MaGV`),
  CONSTRAINT `gv_dugiang_ibfk_2` FOREIGN KEY (`MaLop`) REFERENCES `lophoc` (`MaLop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gv_dugiang`
--

LOCK TABLES `gv_dugiang` WRITE;
/*!40000 ALTER TABLE `gv_dugiang` DISABLE KEYS */;
/*!40000 ALTER TABLE `gv_dugiang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MaKhoa` varchar(16) NOT NULL,
  `MaTruong` varchar(8) NOT NULL,
  `TenKhoa` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MaTruongKhoa` varchar(10) NOT NULL,
  PRIMARY KEY (`MaKhoa`),
  KEY `MaTruong` (`MaTruong`),
  KEY `gv_truongkhoa` (`MaTruongKhoa`),
  CONSTRAINT `gv_truongkhoa` FOREIGN KEY (`MaTruongKhoa`) REFERENCES `giangvien` (`MaGV`),
  CONSTRAINT `khoa_ibfk_1` FOREIGN KEY (`MaTruong`) REFERENCES `truong` (`MaTruong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kyhoc`
--

DROP TABLE IF EXISTS `kyhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kyhoc` (
  `Ki` varchar(8) NOT NULL,
  `TenKiHoc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ThoiGianBatDau` date NOT NULL,
  `ThoiGianKetThuc` date NOT NULL,
  PRIMARY KEY (`Ki`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kyhoc`
--

LOCK TABLES `kyhoc` WRITE;
/*!40000 ALTER TABLE `kyhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `kyhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lophoc`
--

DROP TABLE IF EXISTS `lophoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lophoc` (
  `MaLop` varchar(10) NOT NULL,
  `MaMon` varchar(8) NOT NULL,
  `Ki` varchar(8) NOT NULL,
  `TuanHoc` varchar(20) NOT NULL,
  `PhongHoc` varchar(10) NOT NULL,
  `ThoiGianBatDau` time NOT NULL,
  `ThoiGianKetThuc` time NOT NULL,
  PRIMARY KEY (`MaLop`),
  KEY `MaMon` (`MaMon`),
  KEY `Ki` (`Ki`),
  CONSTRAINT `lophoc_ibfk_1` FOREIGN KEY (`MaMon`) REFERENCES `monhoc` (`MaMon`),
  CONSTRAINT `lophoc_ibfk_2` FOREIGN KEY (`Ki`) REFERENCES `kyhoc` (`Ki`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lophoc`
--

LOCK TABLES `lophoc` WRITE;
/*!40000 ALTER TABLE `lophoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `lophoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lopsinhvien`
--

DROP TABLE IF EXISTS `lopsinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lopsinhvien` (
  `MaCTDT` varchar(8) NOT NULL,
  `MaGiangVienQuanLy` varchar(10) NOT NULL,
  `MSSVLopTruong` char(8) NOT NULL,
  `MSSVBiThu` char(8) NOT NULL,
  `MSSVUyVien` char(8) NOT NULL,
  `MaLop` varchar(16) NOT NULL,
  PRIMARY KEY (`MaLop`),
  KEY `MaCTDT` (`MaCTDT`),
  KEY `MaGiangVienQuanLy` (`MaGiangVienQuanLy`),
  KEY `MSSVLopTruong` (`MSSVLopTruong`),
  KEY `MSSVBiThu` (`MSSVBiThu`),
  KEY `MSSVUyVien` (`MSSVUyVien`),
  CONSTRAINT `lopsinhvien_ibfk_1` FOREIGN KEY (`MaCTDT`) REFERENCES `ctdt` (`MaCTDT`),
  CONSTRAINT `lopsinhvien_ibfk_2` FOREIGN KEY (`MaGiangVienQuanLy`) REFERENCES `giangvien` (`MaGV`),
  CONSTRAINT `lopsinhvien_ibfk_3` FOREIGN KEY (`MSSVLopTruong`) REFERENCES `lylichsinhvien` (`MSSV`),
  CONSTRAINT `lopsinhvien_ibfk_4` FOREIGN KEY (`MSSVBiThu`) REFERENCES `lylichsinhvien` (`MSSV`),
  CONSTRAINT `lopsinhvien_ibfk_5` FOREIGN KEY (`MSSVUyVien`) REFERENCES `lylichsinhvien` (`MSSV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lopsinhvien`
--

LOCK TABLES `lopsinhvien` WRITE;
/*!40000 ALTER TABLE `lopsinhvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `lopsinhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lylichsinhvien`
--

DROP TABLE IF EXISTS `lylichsinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lylichsinhvien` (
  `MSSV` char(8) NOT NULL,
  `MaLopSinhVien` varchar(16) NOT NULL,
  `NgaySinh` date NOT NULL,
  `SoCMND` varchar(20) NOT NULL,
  `QueQuan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `GioiTinh` varchar(10) NOT NULL,
  `TonGiao` varchar(32) NOT NULL,
  `NgayVaoDang` date DEFAULT NULL,
  `NgayVaoDoan` date DEFAULT NULL,
  `ChiDoan` varchar(64) DEFAULT NULL,
  `DanToc` varchar(32) NOT NULL,
  `NoiOHienTai` varchar(128) NOT NULL,
  `DoiTuongChinhSach` varchar(128) DEFAULT NULL,
  `SoTheBaoHiem` varchar(32) DEFAULT NULL,
  `DiaChiThuongTru` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ThuocHo` varchar(64) DEFAULT NULL,
  `SoSo` varchar(32) DEFAULT NULL,
  `HoTen` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(255) NOT NULL,
  `SDT` varchar(20) NOT NULL,
  PRIMARY KEY (`MSSV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lylichsinhvien`
--

LOCK TABLES `lylichsinhvien` WRITE;
/*!40000 ALTER TABLE `lylichsinhvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `lylichsinhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhoc` (
  `MaCTDT` varchar(8) NOT NULL,
  `MaMon` varchar(8) NOT NULL,
  `TenMon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SoTinChi` int NOT NULL,
  `MaHocPhanHocTruoc` varchar(8) DEFAULT NULL,
  `MaHocPhanSongHanh` varchar(8) DEFAULT NULL,
  `SoGioBaiTap` int NOT NULL,
  `SoGioLyThuyet` int DEFAULT NULL,
  `SoGioTuHoc` int NOT NULL,
  `SoGioTN_TH` int DEFAULT NULL,
  `HinhThucThi` varchar(64) NOT NULL,
  `MoTa` varchar(256) DEFAULT NULL,
  `DeCuong` blob NOT NULL,
  `NgonNguGiangDay` varchar(64) NOT NULL,
  PRIMARY KEY (`MaMon`),
  KEY `MaCTDT` (`MaCTDT`),
  CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`MaCTDT`) REFERENCES `ctdt` (`MaCTDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoidung` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(255) NOT NULL,
  `MatKhau` varchar(512) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `SDT` varchar(16) NOT NULL,
  `ThoiGianTaoTaiKhoan` datetime NOT NULL,
  `LanDangNhapCuoi` datetime NOT NULL,
  `VaiTro` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trangthaisinhvien`
--

DROP TABLE IF EXISTS `trangthaisinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trangthaisinhvien` (
  `CPA` decimal(4,2) NOT NULL,
  `SoTinChiTichLuy` int NOT NULL,
  `MSSV` char(8) NOT NULL,
  `TrangThai` varchar(20) NOT NULL,
  `No` int NOT NULL,
  `MucCanhCao` char(1) NOT NULL,
  `TrinhDo` varchar(10) NOT NULL,
  KEY `MSSV` (`MSSV`),
  CONSTRAINT `trangthaisinhvien_ibfk_1` FOREIGN KEY (`MSSV`) REFERENCES `lylichsinhvien` (`MSSV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trangthaisinhvien`
--

LOCK TABLES `trangthaisinhvien` WRITE;
/*!40000 ALTER TABLE `trangthaisinhvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `trangthaisinhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truong`
--

DROP TABLE IF EXISTS `truong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truong` (
  `MaTruong` varchar(8) NOT NULL,
  `TenTruong` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(128) NOT NULL,
  `SoDienThoai` varchar(16) NOT NULL,
  PRIMARY KEY (`MaTruong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truong`
--

LOCK TABLES `truong` WRITE;
/*!40000 ALTER TABLE `truong` DISABLE KEYS */;
/*!40000 ALTER TABLE `truong` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23 14:33:56

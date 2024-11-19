<?php
class MonHoc {
    private $MaCTDT; // String
    private $MaMon; // String
    private $TenMon; // String
    private $SoTinChi; // int
    private $MaHocPhanHT; // String
    private $MaHocPhanSongHanh; // String
    private $TrongSo; // String

    // Hàm khởi tạo
    public function __construct($MaCTDT, $MaMon, $TenMon, $SoTinChi, $MaHocPhanHT, $MaHocPhanSongHanh, $TrongSo) {
        $this->MaCTDT = $MaCTDT;
        $this->MaMon = $MaMon;
        $this->TenMon = $TenMon;
        $this->SoTinChi = $SoTinChi;
        $this->MaHocPhanHT = $MaHocPhanHT;
        $this->MaHocPhanSongHanh = $MaHocPhanSongHanh;
        $this->TrongSo = $TrongSo;
    }
}

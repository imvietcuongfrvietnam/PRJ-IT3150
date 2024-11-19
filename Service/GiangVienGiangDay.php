<?php
class GiangVienGiangDay extends GiangVienService{
    function __construct()
    {
        parent::__construct();
    }
    function CapNhatDiem($giangVien, array $sinhvien){
        $sqlconnect = new SQLConnector();
        $connect = $sqlconnect.getConnection();
        foreach ($sinhvien as $key => $value) {
    }
}
<?php

class GiangVienService
{
    function DangKiLopHoc(GiangVien $giangVien, array $dsLop)
    {
        // Kết nối tới cơ sở dữ liệu
        $sqlconnect = new SQLConnector();
        $connection = $sqlconnect->getConnection();

        foreach ($dsLop as $lop) {
            $query = "INSERT INTO gv_lop (MaGV, MaLop) VALUES (:MaGV, :MaLop)";
            $stmt = $connection->prepare($query);

            $stmt->bindParam(':MaGV', $giangVien->getMaGV());
            $stmt->bindParam(':MaLop', $lop->getMaLop());

            // Thực thi lệnh
            $stmt->execute();
        }

        echo "Đăng ký giảng viên vào lớp học thành công!";
    }
    function XoaDangKy($GiangVien, array $dsLop)
    {
        $sqlconnect = new SQLConnector();
        $connection = $sqlconnect::getConnect();
        foreach ($dsLop as $lop) {
            $query = "DELETE FROM gv_lop WHERE MaGV = :MaGV AND MaLop = :MaLop";
        }
        $stmt = $connection->prepare($query);
$stmt->bindParam(':MaGV', $giangVien->getMaGV());
$stmt->bindParam(':MaLop', $lop->getMaLop());
    }
}
?>

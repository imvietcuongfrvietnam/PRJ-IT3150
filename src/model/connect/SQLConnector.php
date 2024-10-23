<?php
// Định nghĩa các hằng số cần thiết
$path_project = 'PRJ-IT3150';
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', $_SERVER['DOCUMENT_ROOT'] . DS . $path_project);

// Bao gồm các file cần thiết
require_once 'D:/IT1/2024.1/IT3150/workspace/Project/PRJ-IT3150/src/model/connect/IConnector.php';
require_once 'D:\IT1\2024.1\IT3150\workspace\Project\PRJ-IT3150\config\config.php';

class SQLConnector {
    private $db;
    private $host = DB_HOST;
    private $username = DB_USER;
    private $password = DB_PASSWORD;
    private $dbname = DB_NAME;
    private $port = DB_PORT;

    public function __construct() {
        $this->connect();
    }

    function connect() {
        try {
            // Tạo kết nối PDO
            $this->db = new PDO("mysql:host={$this->host};dbname={$this->dbname};port={$this->port}", $this->username, $this->password);
            // Thiết lập chế độ lỗi cho PDO
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Kết nối thành công đến cơ sở dữ liệu!<br>";
        } catch (PDOException $exception) {
            echo "Lỗi kết nối: " . $exception->getMessage();
        }
    }

    function insertTruong($maTruong, $tenTruong, $diaChi, $email, $soDienThoai) {
        $sql = 'INSERT INTO truong (MaTruong, TenTruong, DiaChi, Email, SoDienThoai) VALUES (:maTruong, :tenTruong, :diaChi, :email, :soDienThoai)';
        $stmt = $this->db->prepare($sql);
        // Gán giá trị cho các tham số
        $stmt->bindParam(':maTruong', $maTruong);
        $stmt->bindParam(':tenTruong', $tenTruong);
        $stmt->bindParam(':diaChi', $diaChi);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':soDienThoai', $soDienThoai);

        if ($stmt->execute()) {
            echo "Thêm trường thành công!";
        } else {
            echo "Lỗi thêm trường: " . implode(", ", $stmt->errorInfo());
        }
    }

    function disconnect() {
        $this->db = null; // Ngắt kết nối bằng cách gán lại biến db thành null
        echo "Ngắt kết nối thành công!";
    }
}

// Khởi tạo và thêm trường
$conn = new SQLConnector();
$conn->insertTruong('SOICT', 'Truong CNTT & TT', 'B1', 'cc@example.com', '0123456789');
$conn->disconnect();
?>

<?php
require_once __DIR__ . '/../../config/config.php';
require_once ROOT . DS . 'config' . DS . 'config.php';
require_once ROOT . DS . 'model' . DS . 'connect' . DS . 'SQLConnect.php';

class SQLConnector {
    private static $instance = null;
    private $db;
    private $host = DB_HOST;
    private $username = DB_USER;
    private $password = DB_PASSWORD;
    private $dbname = DB_NAME;
    private $port = DB_PORT;


    // Đặt hàm khởi tạo là private để ngăn việc tạo instance từ bên ngoài
    public function __construct() {
        $this->connect();
    }

    // Hàm tạo instance duy nhất của SQLConnector (Singleton)
    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new SQLConnector();
        }
        return self::$instance;
    }

    public function connect() {
        try {
            $this->db = new PDO("mysql:host={$this->host};dbname={$this->dbname};port={$this->port}", $this->username, $this->password);
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Kết nối thành công đến cơ sở dữ liệu!<br>";
        } catch (PDOException $exception) {
            echo "Lỗi kết nối: " . $exception->getMessage();
        }
    }

    public function disconnect() {
        $this->db = null;
        echo "Ngắt kết nối thành công!";
    }

    // Ngăn clone instance để giữ tính duy nhất
    private function __clone() {}

    // Ngăn unserialize instance để giữ tính duy nhất
    public function __wakeup() {}
}

// Sử dụng instance của SQLConnector
?>

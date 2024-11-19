<?php
// Bắt đầu session và các chức năng cần thiết
session_start();

// Kết nối cơ sở dữ liệu (sử dụng PDO hoặc MySQLi)
$host = 'localhost';
$dbname = 'qldaotao';
$username = 'root';
$password = '19012003Vietcuong@';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}

// Xử lý các logic và điều hướng trong ứng dụng (controller)
if (isset($_GET['page'])) {
    if ($_GET['page'] == 'about') {
        include('views/about.php');
    } else {
        include('views/home.php');
    }
} else {
    include('views/home.php');
}
?>

<?php

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$host = $_ENV['DB_HOST'];
$db = $_ENV['DB'];
$user =$_ENV['USER'];
$password = $_ENV['PASSWORD'];

try {
    $conn = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $password);
  
   $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $conn;
} catch (PDOException $err) {
    echo "Connection failed: " . $err->getMessage();
}

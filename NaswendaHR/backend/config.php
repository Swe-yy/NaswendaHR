<?php

require_once __DIR__ . '/vendor/autoload.php';

$host = 'db';
$db = 'naswendaHR';
$user =' root';
$password = 'password1';

try {

     $conn = new PDO("mysql:host=db;dbname=naswendaHR;charset=utf8", "root", "password1");
    echo "okkk\n";
   $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $conn;
} catch (PDOException $err) {
    echo "Connection failed: " . $err->getMessage();
}

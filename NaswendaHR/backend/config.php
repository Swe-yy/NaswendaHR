<?php

require_once __DIR__ . '/vendor/autoload.php';

$host = 'db';
$db = getenv('DB');
$user = getenv('USER');
$password = getenv('PASSWORD');

try {

    echo "HELLOOOOOOOOO\n";
    $conn = new PDO("mysql:host={$host};port=3307;dbname={$db};charset=utf8", $user, $password);
    echo "okkk\n";
   $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $conn;
} catch (PDOException $err) {
    echo "Connection failed: " . $err->getMessage();
}
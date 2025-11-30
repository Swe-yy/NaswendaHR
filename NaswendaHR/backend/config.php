<?php

require_once dirname(__DIR__,4).'/vendor/autoload.php';

$host = getenv("DB_HOST");
$db = getenv("DB");
$user = getenv("USER");
$password = getenv("PASSWORD");

try{
    $conn = new PDO("mysql: host=$host, dbname=$db, $user,$password");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $conn;
}catch(PDOException $err){
    echo "Connection failed: ". $err->getMessage();
}
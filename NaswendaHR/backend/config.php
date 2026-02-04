<?php

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$host = $_ENV['DB_HOST'];
$db = $_ENV['DB'];
$user =$_ENV['USER'];
$password = $_ENV['PASSWORD'];

// Connection keeps failing 
// make the backend wait for the connection with the database before it tries to use it 

function connectDB($retries = 10, $delay = 3) {
    $attempt = 0;
    
    while ($attempt < $retries) {
        try {
            $conn = new PDO("mysql:host=db;dbname=naswendaHR;charset=utf8", "root", "password1");
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;
        } catch (PDOException $e) {
            $attempt++;
            if ($attempt >= $retries) {
                throw $e; // Final failure
            }
            error_log("DB connection attempt $attempt failed: " . $e->getMessage());
            sleep($delay);
        }
    }
}


    
$trying = 10;
$wait = 3;

$try = 0;

while($try < $trying){
    try{
        $conn = new PDO ("mysql:host=$host;dbname=$db;charset=utf8", $user, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "Connected Successfully";
        return $conn;

} catch (PDOException $err) {
    $try++;

    if($try >= $trying) throw $err;
    
    error_log("Connection failed: " . $err->getMessage() . "\n");
    sleep($wait);
    
}
}
<?php

header("Content-Type: application/json");

class API{
    private $con;

    public static function instance(){
        static $instance = null;

        if($instance === null) $instance = new API;
        return $instance;
    }

    private function __construct(){
        echo "Construct\n";
        echo __DIR__."\n";
        $this->con = require __DIR__."/config.php";
    }

    public function __destruct(){
        $this->con = null;
    }
}

$api = API::instance();

$request = $_SERVER["REQUEST_METHOD"];
$json = file_get_contents("php://input");
$obj = json_decode($json, true);



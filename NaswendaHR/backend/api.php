<?php

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

header("Content-Type: application/json");

class API{
    private $con;

    public static function instance(){
        static $instance = null;

        if($instance === null) $instance = new API;
        return $instance;
    }

    private function __construct(){
        $this->con = require __DIR__."/config.php";
    }

    public function __destruct(){
        $this->con = null;
    }

    public function validateReqType($request){
        if(!isset($request) && urldecode($request) == null)
                return $this->response("Error","Http/1.1 400 Bad Request","error","Null Object",null);
    
        $types = explode(",",$_ENV['API_TYPES']);
        $request = htmlspecialchars(trim($request));

        $reqType = $_SERVER["REQUEST_METHOD"];
        
        if($reqType === "POST" || $reqType === "PUT"){
            $valid = array_intersect($type,$request['type']);

            if(sizeof($valid) <= 0) 
                 return $this->response("Error","Http/1.1 400 Bad Request","error","Missing / Invalid Request Type",null);
        }

        switch($reqType){
            case "GET":
                break;
            
            case "POST":
                break;
            
            case "PATCH": 
                break;

            case "DELETE":
                break;

            default:
                 return $this->response("Error","Http/1.1 400 Bad Request","error","Invalid Request",null);
        }

    
    }

    private function response($type,$header,$result,$message,$data){


    }

    private function get($url, $type){}

    private function register($body){
        foreach($body as $key => $value){
            $body[$key] = htmlspecialchars(trim($value));
        }


        $valid = true;

        // check for blank values
        foreach($body as $key => $value){
            if(empty($value)) $valid = false;
        }

        if(!$valid) return $this->response("Error","Http/1.1 400 Bad Request","error","Missing / Invalid Parameters",null);
        

        // check email and password regex
        $email_check = preg_match('/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/', $body['email']);
        $pass_check = preg_match('/^((?=.*\W)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])).{8,}$/', $body['password']);

        if(empty($email_check))
                return $this->response("Error","Http/1.1 400 Bad Request","error","Incorrect email format",null);
        
        if(empty($pass_check))
            return $this->response("Error","Http/1.1 400 Bad Request","error","Incorrect password format",null);
    
        // check that email doesn't already 
        $stmt = $this->con->prepare("SELECT * FROM Personal_Details WHERE email = :email");
        $stmt->execute([':email'=> $body['email']]);

        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if(sizepf($result) < 1)
            return $this->response("Error","Http/1.1 400 Bad Request","error","Email already in use",null);


        // Passed all validation - register user 

        $salt = bin2hex(random_bytes(6));
        $season = $body['password'].$salt;
        $cook = hash("sha256",$season);

        $apikey = bin2hex(random_bytes(16));

        $params = [];

        foreach($data as $key => $value){
            $params[$key] = $value;
        }

        //remove type field
        array_splice($params,1,1);

        // add in password and apikey 
        $params['password'] = $cook;
        $params['salt'] = $salt;
        $params['apikey'] = $apikey;

        $insert = "INSERT INTO Personal_Details (ID,emp_num,first_name,last_name,initials,title,home_lang,pref_lang,ethnic_group,marital_status,prev_surname,gender,start_date,nationality,highest_qualification,email,password,salt,apikey)";
        $insert = $insert . "VALUES (:ID,:emp_num,:first_name,:last_name,:initials,:title,:home_lang,:pref_lang,:ethnic_group,:marital_status,:prev_surname,:gender,:start_date,:nationality,:highest_qualification,:email,:password,:salt,:apikey)";

        $stmt = $this->con->prepare($insert);
        $stmt->execute($params);
    }

    private function login($body){}

    private function reqLeave($id, $body){}

    private function cancelLeave($id, $body){}

}

$api = API::instance();

$request = $_SERVER["REQUEST_METHOD"];
$json = file_get_contents("php://input");
$obj = json_decode($json, true);



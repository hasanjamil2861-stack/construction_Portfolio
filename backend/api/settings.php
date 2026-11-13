<?php

// allow the react app to call this api (cors)
header("Access-Control-Allow-Origin: *");

// response is json
header("Content-Type: application/json; charset=UTF-8");

// get the $pdo connection
require_once __DIR__ . "/../config/db.php";

// get settings as key => value pairs
$settings = $pdo->query("SELECT setting_key, setting_value FROM site_settings")->fetchAll(PDO::FETCH_KEY_PAIR);

// send back as json
echo json_encode($settings);
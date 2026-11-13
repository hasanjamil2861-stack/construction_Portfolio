<?php

// allow the react app to call this api (cors)
header("Access-Control-Allow-Origin: *");

// response is json
header("Content-Type: application/json; charset=UTF-8");

// get the $pdo connection
require_once __DIR__ . "/../config/db.php";

// about section (single row)
$about = $pdo->query("SELECT * FROM about_section LIMIT 1")->fetch();

// active features only, ordered by sort_order
$features = $pdo->query("SELECT * FROM about_features WHERE is_active = 1 ORDER BY sort_order")->fetchAll();

// send everything back as json
echo json_encode(["about" => $about, "features" => $features]);
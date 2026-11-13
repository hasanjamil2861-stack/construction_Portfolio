<?php

// allow the react app to call this api (cors)
header("Access-Control-Allow-Origin: *");

// response is json
header("Content-Type: application/json; charset=UTF-8");

// get the $pdo connection
require_once __DIR__ . "/../config/db.php";

// hero section (single row)
$hero = $pdo->query("SELECT * FROM hero_section LIMIT 1")->fetch();

// active stats only, ordered by sort_order
$stats = $pdo->query("SELECT * FROM hero_stats WHERE is_active = 1 ORDER BY sort_order")->fetchAll();

// send everything back as json
echo json_encode(["hero" => $hero, "stats" => $stats]);
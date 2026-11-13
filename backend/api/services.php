<?php

// allow the react app to call this api (cors)
header("Access-Control-Allow-Origin: *");

// response is json
header("Content-Type: application/json; charset=UTF-8");

// get the $pdo connection
require_once __DIR__ . "/../config/db.php";

// services header + image card (single row)
$section = $pdo->query("SELECT * FROM services_section LIMIT 1")->fetch();

// active services only, ordered by sort_order
$services = $pdo->query("SELECT * FROM services WHERE is_active = 1 ORDER BY sort_order")->fetchAll();

// track record text (single row)
$trackRecord = $pdo->query("SELECT * FROM track_record_section LIMIT 1")->fetch();

// active track record stats, ordered by sort_order
$trackStats = $pdo->query("SELECT * FROM track_record_stats WHERE is_active = 1 ORDER BY sort_order")->fetchAll();

// send everything back as json
echo json_encode([
    "section"     => $section,
    "services"    => $services,
    "trackRecord" => $trackRecord,
    "trackStats"  => $trackStats
]);
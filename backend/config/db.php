<?php

// database connection settings
$host     = "localhost";               // mysql server
$dbname   = "construction_portfolio";  // database name
$username = "root";                    // xampp default user
$password = "";                        // xampp default has no password

try {
    // open the connection 
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);

    // throw an exception if any query fails
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // return rows using column names as keys
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    // connection failed
    http_response_code(500);                                     // server error status
    echo json_encode(["error" => "Database connection failed"]); // send error as json
    exit;                                                        // stop the script
}
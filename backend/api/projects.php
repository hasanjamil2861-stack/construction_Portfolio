<?php

// allow the react app to call this api (cors)
header("Access-Control-Allow-Origin: *");

// response is json
header("Content-Type: application/json; charset=UTF-8");

// get the $pdo connection
require_once __DIR__ . "/../config/db.php";

// projects header (single row)
$section = $pdo->query("SELECT * FROM projects_section LIMIT 1")->fetch();

// active categories for the filter buttons
$categories = $pdo->query("SELECT * FROM project_categories WHERE is_active = 1 ORDER BY sort_order")->fetchAll();

// active projects with their category name and slug
$projects = $pdo->query("
    SELECT p.*, c.name AS category_name, c.slug AS category_slug
    FROM projects p
    JOIN project_categories c ON c.id = p.category_id
    WHERE p.is_active = 1 AND c.is_active = 1
    ORDER BY p.sort_order
")->fetchAll();

// send everything back as json
echo json_encode([
    "section"    => $section,
    "categories" => $categories,
    "projects"   => $projects
]);
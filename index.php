<?php
//including the database connection file
include_once("config.php");

//fetching data in descending order (lastest entry first)
$result = $dbConn->query("SELECT * FROM users ORDER BY id DESC");
$rows = $result->fetchAll(PDO::FETCH_ASSOC);

// Convert to JSON
echo $jsonData = json_encode($rows);?>

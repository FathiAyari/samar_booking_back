<?php
// Set CORS headers
header("Access-Control-Allow-Origin: *"); // Allow requests from any origin
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Allow GET, POST, and OPTIONS requests
header("Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Requested-With"); // Allow specified headers

// Including the database connection file
include_once("../config.php");

// Retrieve category from GET parameter
$sql = "";
$type = $_GET['type'];
$value = $_GET['value'];
if($type=="name"){
    $sql ="SELECT * FROM livre  WHERE Titre = :value";
}elseif ($type=="type"){
    $sql="SELECT * FROM livre   WHERE Categorie = :value";
}

// Prepare the SQL statement with a placeholder for the category

// Prepare and execute the statement
$stmt = $dbConn->prepare($sql);
if ($type == "name" || $type == "type") {
    $stmt->bindParam(':value', $value);
}

$stmt->execute();

// Fetch the results
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Convert to JSON
$jsonData = json_encode($rows);
echo $jsonData;
?>

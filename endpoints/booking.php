<?php
include_once("../config.php");

// Allow from any origin
if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');    // cache for 1 day
}

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

    exit(0);
}

header("Content-Type: application/json");

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve data from the body of the POST request
    $data = json_decode(file_get_contents("php://input"), true);

    // Access specific fields from the data
    $idUser = $data['idUser'];
    $idLivre = $data['idLivre'];
    $delais = $data['delais'];

    $sql = "INSERT INTO emprunter(idUser, idLivre,delais) VALUES(:idUser, :idLivre,:delais)";
    $query = $dbConn->prepare($sql);

    $query->bindparam(':idUser', $idUser);
    $query->bindparam(':idLivre', $idLivre);
    $query->bindparam(':delais', $delais);
    $query->execute();
    echo json_encode(array("message" => "Data received successfully","status"=>200));
} else {
    // If the request method is not POST, output an error message
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("error" => "Method not allowed"));
}
?>

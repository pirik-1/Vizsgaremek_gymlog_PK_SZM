<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "gymlog";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Adatbázis hiba");
}

?>
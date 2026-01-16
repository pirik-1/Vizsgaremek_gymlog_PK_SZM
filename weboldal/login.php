<?php
session_start();
require "db.php";

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: bejelentkezes.php");
    exit;
}

$email  = trim($_POST["email"] ?? "");
$jelszo = $_POST["jelszo"] ?? "";

$sql = "SELECT * FROM felhasznalo WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();

$result = $stmt->get_result();
$user = $result->fetch_assoc();


$hashPrefix = substr($user["jelszo"], 0, 4); // pl. $2y$
$verifyOk = password_verify($jelszo, $user["jelszo"]);


if ($user && password_verify($jelszo, $user["jelszo"])) {
    $_SESSION["user_id"] = $user["id"];
    header("Location: index.php");
    exit;
}

$_SESSION["hiba"] = "Hibás email vagy jelszó";
header("Location: bejelentkezes.php");
exit;


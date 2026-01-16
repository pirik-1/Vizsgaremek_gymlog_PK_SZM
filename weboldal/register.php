<?php
session_start();
require "db.php";

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: regisztracio.php");
    exit;
}

$email = trim($_POST["email"] ?? "");
$nev = trim($_POST["nev"] ?? "");
$jelszo1 = $_POST["jelszo"] ?? "";
$jelszo2 = $_POST["jelszo_ujra"] ?? "";

// Alap ellenőrzések
if ($email === "" || $nev === "" || $jelszo1 === "" || $jelszo2 === "") {
    $_SESSION["hiba"] = "Minden mező kitöltése kötelező.";
    header("Location: regisztracio.php");
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $_SESSION["hiba"] = "Érvénytelen e-mail cím.";
    header("Location: regisztracio.php");
    exit;
}

if ($jelszo1 !== $jelszo2) {
    $_SESSION["hiba"] = "A két jelszó nem egyezik.";
    header("Location: regisztracio.php");
    exit;
}

// Email foglaltság ellenőrzése
$check = $conn->prepare("SELECT id FROM felhasznalo WHERE email = ?");
$check->bind_param("s", $email);
$check->execute();
$exists = $check->get_result()->fetch_assoc();

if ($exists) {
    $_SESSION["hiba"] = "Ezzel az e-mail címmel már létezik fiók.";
    header("Location: regisztracio.php");
    exit;
}

// Mentés
$hash = password_hash($jelszo1, PASSWORD_DEFAULT);
$admin = 0;

$sql = "INSERT INTO felhasznalo (email, jelszo, nev, admin) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssi", $email, $hash, $nev, $admin);

if ($stmt->execute()) {
    // siker: vissza loginra
    header("Location: bejelentkezes.php");
    exit;
}

$_SESSION["hiba"] = "Hiba a regisztráció során.";
header("Location: regisztracio.php");
exit;

<?php
session_start();
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="icon" type="image/x-icon" href="img/gymlog-white.png">
    <title>Regisztráció</title>

    <script src="js/regisztracio.js" defer></script>
</head>
<body>

<form class="regDiv" method="POST" action="register.php">
    <h1>GymLog</h1>

    <h2>E-mail:</h2>
    <input type="email" name="email" placeholder="E-mail" class="inputok" id="email" required>

    <h2>Felhasználónév:</h2>
    <input type="text" name="nev" placeholder="Felhasználónév" class="inputok" id="nev" required>

    <h2>Jelszó:</h2>
    <input type="password" name="jelszo" placeholder="Jelszó" class="inputok" id="jelszoReg" required>

    <h2>Jelszó újra:</h2>
    <input type="password" name="jelszo_ujra" placeholder="Jelszó újra" class="inputok" id="jelszoRegUjra" required>

    <span class="mutasdajelszot" id="mutasdReg">Mutasd a jelszót</span>
    <br><br>

    <button id="reg" type="submit">Regisztráció</button>

    <!-- NE legyen button a linkben -->
    <a href="bejelentkezes.php" class="btn btn-secondary">Mégse</a>

    <br><br>

    <p id="hiba" style="color:red;">
        <?php
        if (isset($_SESSION["hiba"])) {
            echo htmlspecialchars($_SESSION["hiba"]);
            unset($_SESSION["hiba"]);
        }
        ?>
    </p>
</form>

</body>
</html>

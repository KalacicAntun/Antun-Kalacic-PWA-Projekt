<?php

$dbc = mysqli_connect("localhost", "root", "", "projekt");
mysqli_set_charset($dbc, "utf8");
if ($dbc) {
    #echo "Connected successfully";
    }

$id = $_GET['id'];

$sql = "SELECT * FROM vijesti WHERE id = '$id'";
$result = $dbc->query($sql);
while($row = $result->fetch_assoc()) {
    $category = $row['kategorija'];
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styleClanak.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@700&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">

    <title>Članak</title>
</head>
<body>

<header>
        <div class="logo">
            <img src="slike/welt_logo.png" alt="" width="110" style="padding: 10px;">
        </div>
        <nav id="myTopnav">
            <a href="index.php" class="active">HOME</a>
            <a href="kategorija.php?id=kultura">KULTURA</a>
            <a href="kategorija.php?id=sport">SPORT</a>
            <a href="login.html">ADMINISTRACIJA</a>
            <a href="unos.html">UNOS</a>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </nav>
</header>

<main>
    <?php
        echo '<h2 style="text-transform: uppercase; border-bottom: 1px solid #d7d7d7;">' . $category . '</h2>';
        $result = $dbc->query($sql);
        echo "<section>";
        while($row = $result->fetch_assoc()) {
            echo "<article>";
            echo "<h2 style='padding:0;'>" . $row['naslov'] . "</h2>";
            #echo "<br>";
            echo "<p>" . "Stand: " . $row['datum'] . "</p>";
            #echo "<br>";
            echo '<img style="width:100%;" src="' . './image/' . $row['filename'] . '"';
            echo "<br>";
            #echo "<h3>" . $row['sazetak'] . "</h3>";
            echo "<p>" . $row['tekst'] . "</p>";
            echo "</article>";
        }
        echo "</section>";
    ?>
</main>
<footer>
    <img src="slike/welt_logo.png" alt="" width="110" style="padding: 30px;">
</footer>

</body>
</html>


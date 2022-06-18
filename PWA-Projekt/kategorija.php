<?php

$db = mysqli_connect("localhost", "root", "", "projekt");
mysqli_set_charset($db, "utf8");
if ($db) {
    #echo "Connected successfully";
    }

$id = $_GET['id'];

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Kategorija - <?php echo $id;?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@700&display=swap" rel="stylesheet">

</head>

<body>
    <header>
        <div class="logo">
            <img src="slike/welt_logo.png" alt="" width="110" style="padding: 10px;">
        </div>
        <nav id="myTopnav">
            <a href="index.php">HOME</a>
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
        <h2 style="text-transform: uppercase;"><?php echo $id; ?></h2>
        
        <?php
        #$kategorija=$_GET[kategorija];
        $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='$id'";
        $result = mysqli_query($db, $query);
        $i=0;
        echo '<section>';
        while($row = mysqli_fetch_array($result)) {

        echo '<article style="min-width: 30%;">';
        echo "<a style='text-decoration: none; color: black;' href='clanak.php?id=" . $row['id'] . "'>";
        echo '<img src="' . './image/' . $row['filename'] . '"';
        echo "</a>";
        echo '<h3>';
        echo $row['naslov'];
        echo '</h3>';
        echo '<p>';
        echo $row['sazetak'];
        echo '<p>';
        echo "<p style='font-size: 14px;'>" . $row['datum'] . "</p>";
        echo '</article>';
        $i++;
        if ($i == 3) {
            echo "</section> <section>";
            $i = 0;
        }
        
        }
        echo '</section>';
        ?>
  
    </main>
    
    <footer>
        <img src="slike/welt_logo.png" alt="" width="110" style="padding: 30px;">
    </footer>

    <script>
        function myFunction() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
    </script>

</body>

</html>
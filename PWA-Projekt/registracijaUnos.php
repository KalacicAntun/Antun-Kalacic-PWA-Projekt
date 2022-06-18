<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styleUnos.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@700&display=swap" rel="stylesheet">

    <title>Registracija</title>
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
            <a href="login.html" class="active">ADMINISTRACIJA</a>
            <a href="unos.html">UNOS</a>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </nav>
    </header>
    <main>
        <section>
        <?php

        $dbc = mysqli_connect("localhost", "root", "", "projekt");
            mysqli_set_charset($dbc, "utf8");
        if ($dbc) {
            #echo "Connected successfully";
        }

        $ime = $_POST['ime'];
        $prezime = $_POST['prezime'];
        $username = $_POST['username'];
        $lozinka = $_POST['pass'];
        $hashed_password = password_hash($lozinka, CRYPT_BLOWFISH);
        $razina = 0;
        $registriranKorisnik = '';
        //Provjera postoji li u bazi već korisnik s tim korisničkim imenom
        $sql = "SELECT korisnicko_ime FROM korisnik WHERE korisnicko_ime = ?";
        $stmt = mysqli_stmt_init($dbc);
        if (mysqli_stmt_prepare($stmt, $sql)) {
        mysqli_stmt_bind_param($stmt, 's', $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);
        }
        if(mysqli_stmt_num_rows($stmt) > 0){
        $msg='Korisničko ime već postoji!';
        echo '<p style="padding:25px;">' . $msg . '</p>';
        #echo $msg;
        }else{
        // Ako ne postoji korisnik s tim korisničkim imenom - Registracija korisnika u bazi pazeći na SQL injection
        $sql = "INSERT INTO korisnik (ime, prezime,korisnicko_ime, lozinka,
        razina)VALUES (?, ?, ?, ?, ?)";
        $stmt = mysqli_stmt_init($dbc);
        if (mysqli_stmt_prepare($stmt, $sql)) {
        mysqli_stmt_bind_param($stmt, 'ssssd', $ime, $prezime, $username,
        $hashed_password, $razina);
        mysqli_stmt_execute($stmt);
        $registriranKorisnik = true;
        echo '<p style="padding:25px;">' . 'Uspješno registriran korisnik!' . '</p>';
        }
        }
        mysqli_close($dbc);
        ?>
        </section>
    </main>
    <footer>
        <img src="slike/welt_logo.png" alt="" width="110" style="padding: 30px;">
    </footer>
</body>
</html>
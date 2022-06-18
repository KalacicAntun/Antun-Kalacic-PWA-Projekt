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

    <title>Log In Provjera</title>
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

        $username = $_POST['username'];
        $lozinka = $_POST['pass'];
        $hashed_password = password_hash($lozinka, CRYPT_BLOWFISH);

        //Provjera postoji li u bazi već korisnik s tim korisničkim imenom
        $query = "SELECT * FROM korisnik WHERE korisnicko_ime='$username'";
        $result = mysqli_query($dbc, $query);
        $row = mysqli_fetch_array($result);

        if (mysqli_num_rows($result)>0) {
            if (password_verify($lozinka, $row['lozinka'])) {
                #echo ('Uspjesan login');
                if ($row['razina'] == 1) {
                    echo '<a style="padding:14px 16px; text-decoration: none; color: white; background-color: #064B71; margin-top: 25px;" href="administrator.php">ADMINISTRACIJA</a>';
                }
                else {
                    echo '<p style="padding:25px;">' . $username . ', nemate dovoljna prava za pristup ovoj stranici.' . '</p>';
                }
            } else {
                #echo ('Neuspjesan login');
                echo '<a style="padding:14px 16px; text-decoration: none; color: white; background-color: #064B71; margin-top: 25px;" href="registracija.html">REGISTRIRAJ SE</a>';
            }
        }
        else {
            #echo ('Neuspjesan login');
            echo '<a style="padding:14px 16px; text-decoration: none; color: white; background-color: #064B71; margin-top: 25px;" href="registracija.html">REGISTRIRAJ SE</a>';
        }
        ?>
        </section>
    </main>
    <footer>
        <img src="slike/welt_logo.png" alt="" width="110" style="padding: 30px;">
    </footer>
</body>
</html>


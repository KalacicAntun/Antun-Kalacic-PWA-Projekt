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

    <title>Admin stranica</title>
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
    <?php

    $dbc = mysqli_connect("localhost", "root", "", "projekt");
    mysqli_set_charset($dbc, "utf8");
    if ($dbc) {
        #echo "Connected successfully";
        }

    $query = "SELECT * FROM vijesti";
    $result = mysqli_query($dbc, $query);
    

$sql = "SELECT * FROM vijesti";
$result = $dbc->query($sql);
    
while($row = $result->fetch_assoc()){
    $selected = $row['kategorija']; ?>
    <form enctype="multipart/form-data" action="" method="POST">
     <div class="form-item"> 
     <label for="title">Naslov vijesti:</label>
    <div class="form-field"> 
    <input type="text" name="title" class="form-field-textual" value="<?php echo $row['naslov'];?>"> 
    </div> 
    </div> 
    <div class="form-item"> 
    <label for="about">Kratki sadržaj vijesti:</label> 
    <div class="form-field"> 
    <textarea name="about" id="" cols="30" rows="10" class="form-field-textual">
        <?php echo $row['sazetak'];?>
    </textarea> 
    </div> 
    </div> 
    <div class="form-item"> 
    <label for="content">Sadržaj vijesti:</label> 
    <div class="form-field"> 
    <textarea name="content" id="" cols="30" rows="10" class="form-field-textual">
        <?php echo $row['tekst'];?>
    </textarea> 
    </div> 
    </div> 
    <div class="form-item"> 
    <label for="pphoto">Slika:</label> 
    <div class="form-field">
        <input hidden type="text" name="filename" value="<?php echo $row['filename'];?>" id="">
<input type="file" class="input-text" id="pphoto" value="<?php echo $row['filename'];?>" name="pphoto"/> 
<br>
<?php echo '<img src="' . "image/" . $row['filename'] . '" width=100px>'?>
</div> 
</div> 
<div class="form-item"> 
<label for="category">Kategorija vijesti:</label> 
<div class="form-field"> 
<select name="category" id="category" class="form-field-textual" value="<?php echo $row ['kategorija']; ?>">
<option <?php if(strtolower($selected) == "sport"){echo "selected ";} ; echo 'value="Sport"'; ?>>Sport</option>
<option <?php if(strtolower($selected) == "kultura"){echo "selected ";} ; echo 'value="Kultura"'; ?>>Kultura</option>  
</select> 
</div> 
</div> 
<div class="form-item"> 
<label>Spremiti u arhivu: 
<div class="form-field">
<?php 
if($row['arhiva'] == 0) { 
    echo '<input type="checkbox" name="archive" id="archive"/> Arhiviraj?'; 
} else { 
        echo '<input type="checkbox" name="archive" id="archive" checked/> Arhiviraj?'; 
    } 
    ?>
</div> 
</label> 
</div> 
</div> 
<div class="form-item"> 
<input type="hidden" name="id" class="form-field-textual" value="<?php echo $row['id'];?>"> 
<button type="reset" value="Poništi">Poništi</button>
<button type="submit" name="update" value="Prihvati"> Izmjeni</button> 
<button type="submit" name="delete" value="Izbriši"> Izbriši</button>
<?php
if(isset($_POST['delete'])){
    
    $id=$_POST['id'];
    echo $id;
    $sql = "DELETE FROM vijesti WHERE id= '$id' "; 
    $result = $dbc->query($sql);
    echo "<meta http-equiv='refresh' content='0'>";
}
    
    if(isset($_POST['update'])){
        $picture = $_FILES['pphoto']['name'];
        if($picture == ""){
            $picture = $_POST['filename'];
        }
        $title = $_POST['title'];
        $about = $_POST['about'];
        $content = $_POST['content'];
        $category = $_POST['category'];
        if(isset($_POST['archive'])){
        $archive = 1;
        header("Refresh:1");
        }else{
        $archive = 0;
        }
        $target_dir = 'image/'.$picture;
        move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir);
        $id=$_POST['id'];
        $sql = "UPDATE vijesti SET naslov='$title', sazetak='$about', tekst='$content', kategorija='$category', arhiva='$archive', filename='$picture' WHERE id=$id ";
        $result = $dbc->query($sql);
        echo "<meta http-equiv='refresh' content='0'>"; 
        }
    ?> 
</div> 
</form>
<br>
<?php
}
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
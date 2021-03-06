<?php

$host	 ="localhost";
$dbname  ="slutproject";
$username="carl.zetterberg";
$password="12345";

$dsn="mysql:host=$host;dbname=$dbname";
$attr=array(PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
			PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");

$pdo = new PDO($dsn,$username,$password,$attr);

if(!empty($_POST))	
{

	//var_dump($_POST);
	$_POST = null;
	$title    = filter_input(INPUT_POST, 'title', FILTER_SANITIZE_SPECIAL_CHARS, FILTER_FLAG_STRIP_LOW);
	$content   = filter_input(INPUT_POST, 'content', FILTER_SANITIZE_SPECIAL_CHARS, FILTER_FLAG_STRIP_LOW);
	$subject_id = filter_input(INPUT_POST, 'subject', FILTER_SANITIZE_SPECIAL_CHARS, FILTER_FLAG_STRIP_LOW);
	$statement = $pdo->prepare("INSERT INTO summary (Title,content) VALUES (:title,:content)");
	$statement->bindParam(":title", $title);
	$statement->bindParam(":content", $content);
	$statement->execute();
	$statement = $pdo->prepare("SELECT MAX(ID) from summary");
	$statement->execute();
	$summary_id = $statement->fetchColumn();
	$statement = $pdo->prepare("INSERT INTO posts (date,summ_id, subject_id) VALUES (NOW(), ?, ?)");
	$statement->bindValue(1, $summary_id);
	$statement->bindValue(2, $subject_id);
	$statement->execute();
}
		
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Slutproject</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<header><h1>Sammanfattnigar-Online</h1></header>

	<nav>
		<ul id = "navigation">
			<a href = "index.php"><li class="bar"><p>Hem</p></li></a>
			<a href = "summ.php"><li class="bar"><p>Sammanfattningar & förslag</p></li></a>
			<a href = "add.php"><li class="bar"><p>Lägg till<p></li></a>
		</ul>
	</nav>

	<div id= "content_wrapper">

		<div id = "container">
			<h1>Lägg till sammanfattning eller förslag</h1>
			<p id="head"></p>

	
		<form action="summ.php" method="POST">
			<p>
				<label for="subjecs_name">Ämnen: </label>
				<select name="subject">
					<?php
						foreach ($pdo ->query("SELECT * FROM subjects ") as $row) 
							{	
								echo "<option value={$row['ID']}>{$row['name']}</option>";
							}
					?>

				</select>
			</p>
			<p>
				<label for="title">Titel: </label>
				<input type="text" name="title"/>
			</p>	
			<p>
				<legend>Innehåll:</legend><textarea  for ="post" rows="5" cols="30" name="content"></textarea>
			</p>
				<input type="submit" value="Lägg till"/>
		</form>
		</div>

	</div>

</body>
</html>
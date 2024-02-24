<!DOCTYPE html>
<html>

<head>
	<title>Please Register yourself</title>
</head>

<body>
	<center>
		<?php
$servername = "localhost";
$username = "root";
$password = "ashish1234";
$dbname = "dbaws";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
		
		// Check connection
		if($conn === false){
			die("ERROR: Could not connect. "
				. mysqli_connect_error());
		}
		
		// Taking all 5 values from the form data(input)
		$id = $_REQUEST['id'];
		$username = $_REQUEST['username'];
		$name = $_REQUEST['name'];
		$Password = $_REQUEST['Password'];
		
		
		$sql = "INSERT INTO users VALUES ('$id',
			'$username','$name','$Password')";
		
		if(mysqli_query($conn, $sql)){
			echo "<h3>data stored in a database successfully."
				. " Please browse your localhost php my admin"
				. " to view the updated data</h3>";

			echo nl2br("\n$id\n $username\n "
				. "$name\n $Password ");
		} else{
			echo "ERROR: Hush! Sorry $sql. "
				. mysqli_error($conn);
		}
		
		// Close connection
		mysqli_close($conn);
		?>
	</center>
</body>

</html>
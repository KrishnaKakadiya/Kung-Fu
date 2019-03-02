<?php 


//check if all the data is filled

if (isset($_POST['submit'])) {
	
	$dbLink = new mysqli('localhost','root','','kungfu');

	if (mysqli_connect_errno()) {
		
		die("MySQL connection failed".mysqli_connect_errno());
	}

	//Gathering all required data

	
	$email = $dbLink->real_escape_string($_POST['email']);
	$password = $dbLink->real_escape_string($_POST['password']);

	//SQL Query

	$query = "INSERT INTO `parentsinfo`(`email`,`password`) VALUES('{$email}','{$password}')";

	//execute the query

	$result = $dbLink->query($query);

	//check if details has been sent to the database

		if ($result) {
		# code...
		echo "Your details has been sent..!";
	}
	else{
		echo 'Error'."<pre>{$dbLink->error}</pre>";
	}

	$dbLink->close();
}

 ?>
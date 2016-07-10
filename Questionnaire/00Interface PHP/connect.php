<?php

	// REMOVE BEFORE PUTTING ON GITHUB
	$host = 'host'; 
	$username = 'username';
	$password = 'password';
	$database = 'database';
	
	//$con = mysqli_connect($host,$username,$password,$database);
	$con = new PDO('mysql:host ='.$host.';dbname='.$database, $username, $password);
	
	if (!$con) {
	    die('Could not connect: ' . mysqli_error($con));
	}

?>

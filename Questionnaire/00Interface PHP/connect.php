<?php

	// REMOVE BEFORE PUTTING ON GITHUB
	$host = 'vistatv.wmprojects.nl'; 
	$username = 'wmprojec_vistasu';
	$password = 'Uw_8zY!B';
	$database = 'wmprojec_vistatv';
	
	//$con = mysqli_connect($host,$username,$password,$database);
	$con = new PDO('mysql:host ='.$host.';dbname='.$database, $username, $password);
	
	if (!$con) {
	    die('Could not connect: ' . mysqli_error($con));
	}

?>
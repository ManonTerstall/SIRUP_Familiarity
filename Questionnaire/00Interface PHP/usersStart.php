<?php
	$user_id = json_decode($_GET['user_id']);

	include "connect.php";
	
	$query = sprintf("INSERT INTO `usersStart` (`user_id`) VALUES ('%s')", 
		$user_id);

	$con->exec($query);
	// $e = $con->errorInfo();
	// if($e[2] != ""){
	// 	$user_id = rand(0, 1000000);

	// 	$query = sprintf("INSERT INTO `usersStart` (`user_id`) VALUES ('%s')", 
	// 		$user_id);

	// 	$con->exec($query);
	// 	$e = $con->errorInfo();
	// }

	// echo $user_id;

?>
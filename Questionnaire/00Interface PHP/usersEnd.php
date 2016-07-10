<?php
	$user_id = json_decode($_GET['user_id']);
	$start_date = json_decode($_GET['start_date']);
	$end_date = json_decode($_GET['end_date']);

	include "connect.php";

	// put in new answer
	$query = sprintf("INSERT INTO `userEnd` (`user_id`) VALUES ('%s')", 
				$user_id);
	
	$con->exec($query);

?>
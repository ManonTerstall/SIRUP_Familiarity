<?php
	$user_id = json_decode($_GET['user_id']);
	$likedPids = json_decode($_GET['likedPids']);
	$dislikedPids = json_decode($_GET['dislikedPids']);
	$likedGenres = json_decode($_GET['likedGenres']);
	$likedFormats = json_decode($_GET['likedFormats']);

	include "connect.php";
	
	// first delete old value based on combi date + user_id (if there is none, nothin will be deleted)
	// $query_delete = sprintf("DELETE FROM `firstPageAnswer` WHERE `user_id` = '%s' AND `start_date` = '%s'", 
	// 	$user_id, 
	// 	$start_date);

	// $con->exec($query_delete);

	// put in new answer
	$query = sprintf("INSERT INTO `firstPageAnswer` (`user_id`, `likedPids`, `dislikedPids`, `likedGenres`, `likedFormats`) VALUES ('%s','%s','%s','%s','%s')", 
				$user_id,
				implode(', ', $likedPids),
				implode(', ', $dislikedPids),
				implode(', ', $likedGenres),
				implode(', ', $likedFormats));
	
	$con->exec($query);

?>
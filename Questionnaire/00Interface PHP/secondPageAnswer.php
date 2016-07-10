<?php
	$user_id = json_decode($_GET['user_id']);
	$gender = json_decode($_GET['gender']);
	$age = json_decode($_GET['age']);
	$degree = json_decode($_GET['degree']);
	$country = json_decode($_GET['country']);
	$favouriteProgram = json_decode($_GET['favouriteProgram']);
	$genresLike = json_decode($_GET['genresLike']);
	$formatsLike = json_decode($_GET['formatsLike']);

	include "connect.php";
	// first delte old value based on combi date + user_id
	// $query_delete = sprintf("DELETE FROM `secondPageAnswer` WHERE `user_id` = '%s'",
	// 	$user_id);

	// $con->exec($query_delete);

	// put in new answer
	$query = sprintf("INSERT INTO `secondPageAnswer` (`user_id`, `gender`, `age`, `degree`, `country`, `favourite_program`, `genres_like`, `formats_like`) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s')", 
				$user_id,
				$gender,
				$age,
				$degree,
				$country,
				$favouriteProgram,
				implode(', ', $genresLike),
				implode(', ', $formatsLike));
	$con->exec($query);
?>






















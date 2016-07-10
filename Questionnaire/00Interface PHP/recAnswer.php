<?php
	$user_id = json_decode($_GET['user_id']);
	$pleasant = json_decode($_GET['pleasant']);
	$relevant = json_decode($_GET['relevant']);
	$unexpected = json_decode($_GET['unexpected']);
	$interest = json_decode($_GET['interest']);
	$cosineLike = json_decode($_GET['cosineLike']);
	$cosineDislike = json_decode($_GET['cosineDislike']);
	$sortRec = json_decode($_GET['sort']);
	$knowRec = json_decode($_GET['know']);
	$likeRec = json_decode($_GET['like']);
	$recNum = json_decode($_GET['recNum']);
	$database_rec;


	switch($recNum){
		case "One":
			$database_rec = 'answerRecOne';
			break;
		case "Two":
			$database_rec = 'answerRecTwo';
			break;
		case "Three":
			$database_rec = 'answerRecThree';
			break;
		case "Four":
			$database_rec = 'answerRecFour';
			break;
		case "Five":
			$database_rec = 'answerRecFive';
			break;
		case "Six":
			$database_rec = 'answerRecSix';
			break;
		case "Seven":
			$database_rec = 'answerRecSeven';
			break;
		case "Eight":
			$database_rec = 'answerRecEight';
			break;
		case "Nine":
			$database_rec = 'answerRecNine';
			break;
		case "Ten":
			$database_rec = 'answerRecTen';
			break;
		case "Eleven":
			$database_rec = 'answerRecEleven';
			break;
		case "Twelve":
			$database_rec = 'answerRecTwelve';
			break;
		case "Thirteen":
			$database_rec = 'answerRecThirteen';
			break;
		case "Fourteen":
			$database_rec = 'answerRecFourteen';
			break;
		case "Fifteen":
			$database_rec = 'answerRecFifteen';
			break;
		case "Sixteen":
			$database_rec = 'answerRecSixteen';
			break;
		case "Seventeen":
			$database_rec = 'answerRecSeventeen';
			break;
		case "Eighteen":
			$database_rec = 'answerRecEighteen';
			break;
		default:
			break;
	}

	include "connect.php";
	// first delte old value based on combi date + user_id
	// $query_delete = sprintf("DELETE FROM `%s` WHERE `user_id` = '%s' AND `start_date` = '%s'",
	// 	$database_rec,
	// 	$user_id,
	// 	$start_date);

	// $con->exec($query_delete);

	// put in new answer
	$query = sprintf("INSERT INTO `%s` (`user_id`, `pleasant`, `relevant`, `unexpected`, `interesting`, `cosineLike`, `cosineDislike`, `sortRec`, `know`, `like`) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')", 
				$database_rec,
				$user_id,
				$pleasant,
				$relevant,
				$unexpected,
				$interest,
				$cosineLike,
				$cosineDislike,
				$sortRec,
				$knowRec,
				$likeRec);
	$con->exec($query)
?>
<?php
	$pids = json_decode($_GET['dislikePids']);
	$seenPids = json_decode($_GET['seenPids']);
	$data = array();

	include "connect.php";

	// metadata
	include "getPidsMeta.php";

	$surrogate_list_metadata = include "getAverage.php";


	// linked data
	include "getPidsLD.php";

	$surrogate_list_ld = include "getAverage.php";

	// then both
	include "getPidsBoth.php";

	$surrogate_list_both = include "getAverage.php";


	$surrogate_list_dislike = array();
	array_push($surrogate_list_dislike, $surrogate_list_metadata);
	array_push($surrogate_list_dislike, $surrogate_list_ld);
	array_push($surrogate_list_dislike, $surrogate_list_both);

	//echo 'here';
	echo json_encode($surrogate_list_dislike);
?>
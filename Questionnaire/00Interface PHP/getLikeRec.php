<?php
	$pids = json_decode($_GET['likePids']);
	$seenPids = json_decode($_GET['seenPids']);
	$data = array();

	include "connect.php";

	// first metadata
	include "getPidsMeta.php";

	//take average of the multiple lists
	$surrogate_list_metadata = include "getAverage.php";

	// then linked data
	include "getPidsLD.php";

	//take average of the multiple lists
	$surrogate_list_ld = include "getAverage.php";

	// then both
	include "getPidsBoth.php";

	$surrogate_list_both = include "getAverage.php";

	$surrogate_list_like = array();
	array_push($surrogate_list_like, $surrogate_list_metadata);
	array_push($surrogate_list_like, $surrogate_list_ld);
	array_push($surrogate_list_like, $surrogate_list_both);

	//echo 'here';
	echo json_encode($surrogate_list_like);


?>
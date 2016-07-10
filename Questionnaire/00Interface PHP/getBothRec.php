<?php
	$dislikePids = json_decode($_GET['dislikePids']);
	$likePids = json_decode($_GET['likePids']);
	$seenPids = json_decode($_GET['seenPids']);

	// query like
	include "connect.php";

	$surrogate_list_metadata = include "getPidsBothMeta.php";

	$surrogate_list_ld = include "getPidsBothLD.php";

	$urrogate_list_both_list = include "getPidsBothBoth.php";

	$surrogate_list_both = array();
	array_push($surrogate_list_both, $surrogate_list_metadata);
	array_push($surrogate_list_both, $surrogate_list_ld);
	array_push($surrogate_list_both, $urrogate_list_both_list);

	//echo 'here';
	echo json_encode($surrogate_list_both);
?>
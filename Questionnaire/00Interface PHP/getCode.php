<?php
	include "connect.php";

	$query="SELECT code FROM  `codeCrowdFlower`";

	$result = $con->query($query); 

	// while there is a new row do:
    foreach($result as $row){
    	// make surrogate array
    	// each row put in data
    	$code = $row['code'];
    } 

	echo json_encode($code);
?>
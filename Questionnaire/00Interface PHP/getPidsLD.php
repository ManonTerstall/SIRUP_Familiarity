<?php
	foreach($pids as $pid){
		$query="SELECT Pid1, Similarity FROM  `LDwithP recommendations` where Pid2= '".$pid."' UNION SELECT Pid2, Similarity FROM `LDwithP recommendations` where Pid1= '".$pid."'";

		$result = $con->query($query); 

		$one_list = array();
		// see if any rows were returned 
		if ($result->rowCount()> 0) { 
		    // yes 
		    // while there is a new row do:
		    foreach($result as $row){
		    	// make surrogate array
		    	// each row put in data
		    	$surrogate_arr = array();
	        	array_push($surrogate_arr, $row['Pid1']);
	        	array_push($surrogate_arr, $row['Similarity']);
		        array_push($one_list, $surrogate_arr);
		    } 
		    $data[] = $one_list;
		    //NOTE: get sim value from first array from first row $data[0][0][1]."\n"; $data[array_num][row_num][0 = pid 1 = sim]
		} 
		else { 
		    // no 
		    // print status message 
		    echo "No rows found!"; 
		} 
	}
	//echo "linked data \n";
?>

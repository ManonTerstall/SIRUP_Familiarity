<?php
	foreach($likePids as $pid){
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
		    //echo $one_list[0][1]."\n";
		    $dataLike[] = $one_list;
		    //echo count($data[0][0])."\n";
		    //get sim value from first array from first row $data[0][0][1]."\n"; $data[array_num][row_num][0 = pid 1 = sim]
		} 
		else { 
		    // no 
		    // print status message 
		    echo "No rows found!"; 
		} 
	}

	// //take average of the multiple lists

	if(count($dataLike) > 1){
		$first_list = array();
		$first_list = $dataLike[0];
		$like_list = array();
		$divisor = count($dataLike); //is it always correct?
		for($i = 0; $i < count($first_list); $i++){
			$pidVal = $first_list[$i][0];
			$sum = $first_list[$i][1];
			if(!in_array($pidVal, $seenPids)){
				for($j = 1; $j < count($dataLike); $j++){
					for($k = 0; $k < count($dataLike[$j]); $k++){
						if($dataLike[$j][$k][0] == $pidVal){
							if(!in_array($dataLike[$j][$k][0], $seenPids)){
								$sum += $dataLike[$j][$k][1];
							}
						}
					}
					$info = array();
					array_push($info, $pidVal);
					$value = $sum/$divisor;
					array_push($info, $value); 
					array_push($like_list, $info);
				}
			}
		}
	}	else {
		$like_list = $dataLike[0];
	}

	// // query dislike

	$dataDislike = array();

	foreach($dislikePids as $pid){
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
		    //echo $one_list[0][1]."\n";
		    $dataDislike[] = $one_list;
		    //echo count($data[0][0])."\n";
		    //get sim value from first array from first row $data[0][0][1]."\n"; $data[array_num][row_num][0 = pid 1 = sim]
		} 
		else { 
		    // no 
		    // print status message 
		    echo "No rows found!"; 
		} 
	}

	// //take average of the dislike
	if(count($dataDislike) > 1){
		$first_list = array();
		$first_list = $dataDislike[0];
		$dislike_list = array();
		$divisor = count($dataDislike); //is it always correct?
		for($i = 0; $i < count($first_list); $i++){
			$pidVal = $first_list[$i][0];
			$sum = $first_list[$i][1];
			if(!in_array($pidVal, $seenPids)){
				for($j = 1; $j < count($dataDislike); $j++){
					for($k = 0; $k < count($dataDislike[$j]); $k++){
						if($dataDislike[$j][$k][0] == $pidVal){
							if(!in_array($dataDislike[$j][$k][0], $seenPids)){
								$sum += $dataDislike[$j][$k][1];
							}
						}
					}
					$info = array();
					array_push($info, $pidVal);
					$value = $sum/$divisor;
					array_push($info, $value); 
					array_push($dislike_list, $info);
				}
			}
		}
	}	else  {
		$dislike_list = $dataDislike[0];
	}

	//echo 'h';
	//echo $like_list;

	$new_list = array();


	// //combina lists 
	for($i = 0; $i<count($like_list);$i++){
		$pid = $like_list[$i][0];
		$likeVal = $like_list[$i][1];
		$dislikeVal = -1;
		for($k = 0; $k < count($dislike_list); $k++){
			if($dislike_list[$k][0] == $pid){
				$dislikeVal = $dislike_list[$k][1];
			}
		}
		if($dislikeVal >= 0){
			$info = array();
			array_push($info, $pid);
			array_push($info, $likeVal);
			array_push($info, $dislikeVal);
			array_push($new_list, $info);
		}
	}

	return $new_list;
?>
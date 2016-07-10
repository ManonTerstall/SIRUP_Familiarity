<?php
	if(count($data) > 1){
		$first_list = array();
		$first_list = $data[0];
		$surrogate_list = array();
		$divisor = count($data); //is it always correct?
		for($i = 0; $i < count($first_list); $i++){
			$pidVal = $first_list[$i][0];
			$sum = $first_list[$i][1];
			if(!in_array($pidVal, $seenPids)){
				for($j = 1; $j < count($data); $j++){
					for($k = 0; $k < count($data[$j]); $k++){
						if($data[$j][$k][0] == $pidVal){
							if(!in_array($data[$j][$k][0], $seenPids)){
								$sum += $data[$j][$k][1];
							}
						}
					}
					$info = array();
					array_push($info, $pidVal);
					$value = $sum/$divisor;
					array_push($info, $value); 
					array_push($surrogate_list, $info);
				}
			}
		}
	}	else {
		$surrogate_list = $data[0];
	}

	//echo "getAverage \n";

	return $surrogate_list;
?>
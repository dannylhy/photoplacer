<?php
	include 'db_helper.php';
	include 'system_params.php';
	
	# populates the locations_gtplaces table
	function populateGtPlaces() {
		$r = file_get_contents("http://m.gatech.edu/w/gtplaces/c/api/buildings");
		$array = json_decode($r);
		
	    foreach ($array as $building) {
	    	if ($building->latitude != null) {
	    		$dbQuery = sprintf("INSERT INTO locations_gtplaces (b_id, name, address, image_url, longitude, latitude)
	    			VALUES ('%s', '%s', '%s', '%s', '%s', '%s')", $building->b_id, mysql_escape_string($building->name), mysql_escape_string($building->address), $building->image_url, $building->longitude, $building->latitude);
				$result = getDBResultInserted($dbQuery);
			}
		}

		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	# fills the locations_zoomout, locations_zoomin, photos table with random info
	function randomFillLocations() {
		$dbQuery = "SELECT latitude, longitude, image_url FROM `locations_gtplaces` 
					ORDER BY RAND()
					LIMIT 15";
		$array = getDBResultsArray($dbQuery);
		
		# loop over each location
		foreach ($array as $location) {
			$total_ph_count = 0;
			$dbQuery = sprintf("INSERT INTO locations_zoomout (longitude, latitude, photocount)
	    			VALUES ('%s', '%s', '%s')", $location["longitude"], $location["latitude"], $total_ph_count);
			$result = getDBResultInserted($dbQuery, "LID_1");
			$LID_1 = $result["LID_1"];
			
			for ($i = 1; $i <= rand(5, 15); $i++) {
				if (rand(1, 10) > 5) {
					$lon = $location["longitude"] + (rand(100,1000)/5000000);
				} else {
					$lon = $location["longitude"] - (rand(100,1000)/5000000);
				}
				if (rand(1, 10) > 5) {
					$lat = $location["latitude"] + (rand(100,1000)/5000000);
				} else {
					$lat = $location["latitude"] - (rand(100,1000)/5000000);
				}
				$ph_count = rand(0,100);
				$total_ph_count += $ph_count;
				$dbQuery = sprintf("INSERT INTO locations_zoomin (LID_1, longitude, latitude, photocount)
	    			VALUES ('%s', '%s', '%s', '%s')", $LID_1, $lon, $lat, $ph_count);
				$result = getDBResultInserted($dbQuery, "LID_2");
				$LID_2 = $result["LID_2"];
				
				$dbQuery = sprintf("INSERT INTO photos (url, timestamp, latitude, longitude, UID)
	    			VALUES ('%s', '%s', '%s', '%s', '%s')", $location["image_url"], time() - rand(0, 1000), $lat, $lon, rand(1,5));
				$result = getDBResultInserted($dbQuery, "PH_ID");
				$PH_ID = $result["PH_ID"];
				
				$dbQuery = sprintf("INSERT INTO `location_photo_link` (PH_ID, LID_1, LID_2)
					VALUES ('%s', '%s', '%s')", $PH_ID, $LID_1, $LID_2);
				$result = getDBResultInserted($dbQuery);
			}
			
			$dbQuery = sprintf("UPDATE locations_zoomout SET photocount = %d WHERE LID_1 = %d", $total_ph_count, $LID_1);
			$result = getDBResultAffected($dbQuery);
		}
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
?>

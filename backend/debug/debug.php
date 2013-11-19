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
		/*
		$dbQuery = "SELECT latitude, longitude, image_url FROM `locations_gtplaces` 
					ORDER BY RAND()
					LIMIT 15";
		*/
		$dbQuery = "SELECT X(lat_lng) AS latitude, Y(lat_lng) AS longitude, image_url FROM `locations_gtplaces` 
					WHERE b_id = '153'";
		$array = getDBResultsArray($dbQuery);
		
		$klaus_img = array(
			"http://upload.wikimedia.org/wikipedia/commons/0/04/Binary_Bridge.jpg",
			"http://www.csc.gatech.edu/images/front.jpg",
			"http://www.usgbcga.org/storage/images/klaus.jpg",
			"http://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Klaus_Building_Front.jpg/300px-Klaus_Building_Front.jpg",
			"http://fodava.gatech.edu/files/uploaded/klaus_east.jpg",
			"http://www.whistle.gatech.edu/archives/08/jun/16/klaus.jpg",
			"http://www.cc.gatech.edu/sites/default/files/images/Facilities%20Klaus.jpg",
			"http://www.cc.gatech.edu/compiler/images/1.jpg",
			"http://farm4.staticflickr.com/3331/3501480791_a8c0fb0597_o.jpg",
			"http://buzzpedia.lmc.gatech.edu/wiki/images/thumb/7/7e/Realklaus.jpeg/180px-Realklaus.jpeg",
			"http://vgdev.org/gt-klaus.jpg",
			"http://www.perkinswill.com/sites/default/files/project-imagery/GITKlaus_Exterior_main2_1.jpg",
			"http://www.striplingdesigns.com/gallery/job_04053_c.jpg"
			);
		
		# loop over each location
		
		foreach ($array as $location) {
			$total_ph_count = 0;
			$dbQuery = sprintf("INSERT INTO locations_zoomout (lat_lng, latitude, longitude, photocount)
	    			VALUES (POINT('%s', '%s'), '%s', '%s', '%s')", $location["latitude"], $location["longitude"], $location["latitude"], $location["longitude"], $total_ph_count);
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
				$dbQuery = sprintf("INSERT INTO locations_zoomin (LID_1, lat_lng, latitude, longitude, photocount)
	    			VALUES ('%s', POINT('%s', '%s'), '%s', '%s', '%s')", $LID_1, $lat, $lon, $lat, $lon, $ph_count);
				$result = getDBResultInserted($dbQuery, "LID_2");
				$LID_2 = $result["LID_2"];
				
				for ($j = 1; $j <= rand(5, 20); $j++) {
					
					$ph_lon = $lon;
					$lon_diff = rand(500,1000)/10000000;
					$ph_lat = $lat;
					$lat_diff = rand(500,1000)/10000000;
					
					if (rand(1, 10) > 5) {
						$ph_lon = $ph_lon + $lon_diff;
					} else {
						$ph_lon = $ph_lon - $lon_diff;
					}
					if (rand(1, 10) > 5) {
						$ph_lat = $ph_lat + $lat_diff;
					} else {
						$ph_lat = $ph_lat - $lat_diff;
					}
					
					/*$dbQuery = sprintf("INSERT INTO photos (url, timestamp, lat_lng, latitude, longitude, UID)
		    			VALUES ('%s', '%s', POINT('%s', '%s'), '%s', '%s', '%s')", 
		    			$location["image_url"], date("Y-m-d H:i:s", time() - rand(0, 10000)), $ph_lat, $ph_lon, $ph_lat, $ph_lon, rand(1,5));
		    			*/
		    		$dbQuery = sprintf("INSERT INTO photos (url, timestamp, lat_lng, latitude, longitude, UID)
		    			VALUES ('%s', '%s', POINT('%s', '%s'), '%s', '%s', '%s')", 
		    			$klaus_img[rand(0,12)], date("Y-m-d H:i:s", time() - rand(0, 1000000)), $ph_lat, $ph_lon, $ph_lat, $ph_lon, rand(1,5));
					$result = getDBResultInserted($dbQuery, "PH_ID");
					$PH_ID = $result["PH_ID"];
					
					$dbQuery = sprintf("INSERT INTO `location_photo_link` (PH_ID, LID_1, LID_2)
						VALUES ('%s', '%s', '%s')", $PH_ID, $LID_1, $LID_2);
					$result = getDBResultInserted($dbQuery);
				}
			}
			
			$dbQuery = sprintf("UPDATE locations_zoomout SET photocount = %d WHERE LID_1 = %d", $total_ph_count, $LID_1);
			$result = getDBResultAffected($dbQuery);
		}
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
?>

<?php
	
	# Runs the clustering algo on the point
	# Returns the candidate points for level 1 and level 2 zoom
	function getLIDs($lat, $lng) {
		# Uses a modified version of BIRCH algo
		# 1. Find a point in L1 zoom
		# 2. If couldn't find, check GTplaces for nearby point, add to L1 zoom db
		# 3. For L2 points in L1 location
		#   a. Check if new point is within envelope(L2 point)
		#	b. If in envelope(L2), 
		#		i. add new point to L2 point, recalc center for L2
		#		ii. increment L1 points
		#		iii. add to photos
		#		iv. break
		
		$L1_threshold = 300; # Threshold in feet
		$L2_threshold = 100; # Threshold in feet
		
		# Find in zoomout, otherwise add
		$dbQuery = sprintf("
			SELECT * FROM (
				SELECT X(`lat_lng`) AS `latitude`, Y(`lat_lng`) AS `longitude`, `LID_1`, GLength(LineString(`lat_lng`, POINT(%s,%s))) AS distance 
				FROM locations_zoomout
			) d
			WHERE d.distance < %s
			ORDER BY d.distance ASC
			LIMIT 1", $lat, $lng, $L1_threshold);
		try {
			$result = getDBResultRecord($dbQuery, False);
			$LID_1 = $result['LID_1'];
		} catch (Exception $e) {
			# Try getting from gtplaces db
			$dbQuery = sprintf("
				SELECT * FROM (
					SELECT X(`lat_lng`) AS `latitude`, Y(`lat_lng`) AS `longitude`, GLength(LineString(`lat_lng`, POINT(%s,%s))) AS distance 
					FROM locations_gtplaces
				) d
				WHERE d.distance < %s
				ORDER BY d.distance ASC
				LIMIT 1", $lat, $lng, $L1_threshold);
			try {
				$result = getDBResultRecord($dbQuery, False);
				$l1_lat = $result['latitude'];
				$l1_lng = $result['longitude'];
			} catch (Exception $e) {
				# Failure case. Insert as a new zoomout location
				$l1_lat = $lat;
				$l1_lng = $lng;
			}
			$dbQuery = sprintf("
				INSERT INTO locations_zoomout (`latitude`, `longitude`, `lat_lng`) 
				VALUES (%s, %s, POINT(%s, %s))
				", $l1_lat, $l1_lng, $l1_lat, $l1_lng);
			$result = getDBResultInserted($dbQuery, "LID_1");
			$LID_1 = $result['LID_1'];
		}
		
		# Find in zoomin, otherwise add
		$dbQuery = sprintf("
			SELECT * FROM (
				SELECT X(`lat_lng`) AS `latitude`, Y(`lat_lng`) AS `longitude`, `LID_2`, GLength(LineString(`lat_lng`, POINT(%s,%s))) AS distance 
				FROM locations_zoomin
			) d
			WHERE d.distance < %s
			ORDER BY d.distance ASC
			LIMIT 1", $lat, $lng, $L2_threshold);
		try {
			$result = getDBResultRecord($dbQuery, False);
			$LID_2 = $result['LID_2'];
		} catch (Exception $e) {
			# Insert as a new L2 point
			$dbQuery = sprintf("
				INSERT INTO locations_zoomin (`latitude`, `longitude`, `lat_lng`, `LID_1`) 
				VALUES (%s, %s, POINT(%s, %s), %s)
				", $lat, $lng, $lat, $lng, $LID_1);
			$result = getDBResultInserted($dbQuery, "LID_2");
			$LID_2 = $result['LID_2'];
		}
		
		return array("LID_1" => $LID_1, "LID_2" => $LID_2);
	}

	# Recalculates the lat/lng for the LID2
	function recalculateLID2($LID_2) {
		$dbQuery = sprintf("
			UPDATE locations_zoomin dest, (
				SELECT AVG(X(`lat_lng`)) AS latitude, AVG(Y(`lat_lng`)) AS longitude
				FROM location_photo_link lp
				JOIN photos p
					ON lp.PH_ID = p.PH_ID
				WHERE LID_2 = %s
			) src
  			SET dest.latitude = src.latitude, 
  				dest.longitude = src.longitude,
  				dest.lat_lng = POINT(src.latitude, src.longitude)
  			where dest.LID_2 = %s
  		", $LID_2, $LID_2);
  		$result = getDBResultAffected($dbQuery,False);
		return $result;
	}
?>

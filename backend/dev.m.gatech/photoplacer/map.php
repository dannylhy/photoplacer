<?php
	include 'db_helper.php';
	include 'system_params.php';
	
	# Returns all the top locations
	function getTopLocations($limit) {
		$dbQuery = sprintf("
			SELECT X(`lat_lng`) AS `latitude`, Y(`lat_lng`) AS `longitude`, `photocount`, `LID_1` AS id 
			FROM locations_zoomout 
			ORDER BY `photocount` DESC");
		if ($limit != "") {
			$dbQuery = sprintf("
				%s 
				LIMIT %d", $dbQuery, $limit);
		} else {
			$dbQuery .= " LIMIT 20";
		}
		$result = getDBResultsArray($dbQuery);
		error_log("failed");
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	# Gets zoomed out ids for a bounded location
	function getBoundLocation($sw_lat, $sw_lng, $ne_lat, $ne_lng, $limit) {
		if ($ne_lng == "") {
			echo "4 parameters are needed, the parameters are sw_lat, sw_lng, ne_lat, ne_lng";
			return;
		}
		
		$dbQuery = sprintf("
			SELECT X(`lat_lng`) AS `latitude`, Y(`lat_lng`) AS `longitude`, `photocount`, `LID_1` AS id 
			FROM locations_zoomout 
			WHERE X(`lat_lng`) >= %s AND Y(`lat_lng`) >= %s AND X(`lat_lng`) <= %s AND Y(`lat_lng`) <= %s 
			ORDER BY `photocount` DESC", $sw_lat, $sw_lng, $ne_lat, $ne_lng);
		if ($limit != "") {
			$dbQuery = sprintf("
				%s 
				LIMIT %d", $dbQuery, $limit);
		}
		$result=getDBResultRecord($dbQuery);
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	# Gets the list of zoomed locations, based on the first level zoom id
	function getZoomedLocationsById($lid1) {
		$dbQuery = sprintf("
			SELECT X(`lat_lng`) AS `latitude`, Y(`lat_lng`) AS `longitude`, `photocount`, `LID_2` AS id 
			FROM locations_zoomin 
			WHERE `LID_1` = %s 
			ORDER BY `photocount` DESC", $lid1);
		$result = getDBResultsArray($dbQuery);
		error_log("failed");
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	# Gets the details of photos at the zoomed location
	function getPhotosAtZoomedLocation($lid1, $lid2) {
		$dbQuery = sprintf("
			SELECT p.PH_ID AS photoid, p.url, X(p.lat_lng) AS latitude, Y(p.lat_lng) AS longitude, p.altitude, p.direction, p.timestamp, p.popularity
			FROM photos p
			INNER JOIN location_photo_link l ON p.PH_ID = l.PH_ID
			WHERE l.LID_1 = %d AND l.LID_2 = %d
			ORDER BY p.popularity DESC", $lid1, $lid2);
		
		$result = getDBResultsArray($dbQuery);
		
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
?>

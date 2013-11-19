<?php
	include 'db_helper.php';
	include 'system_params.php';
	
	# Gets all photos with an optional limit
	function getAllPhotos($limit) {
    	$dbQuery = sprintf("
			SELECT `PH_ID` as photoid 
			FROM photos 
			ORDER BY `PH_ID` DESC");
		if ($limit != "") {
			$dbQuery = sprintf("
				%s 
				LIMIT %d", $dbQuery, $limit);
		}
		$result = getDBResultsArray($dbQuery);
		header("Content-type: application/json");
		echo json_encode($result);
	}

	# Gets a single photo from the db based on the photoid
	function getPhoto($photoid, $username) {
		if (!empty($username)) {
			$dbQuery = sprintf("
				SELECT UID 
				FROM users 
				WHERE username = '%s'", 
				$username);
			$result = getDBResultRecord($dbQuery);
			$uidstr = $result['UID'];
			
			$dbQuery = sprintf("
				SELECT p.PH_ID AS photoid, p.url, X(p.lat_lng) AS latitude, Y(p.lat_lng) AS longitude, p.altitude, p.direction, p.timestamp, p.popularity, u.username, wishlisted, GROUP_CONCAT(t.text) AS tags 
				FROM (
					SELECT * 
					FROM photos 
					WHERE PH_ID = %s
				) p
				LEFT JOIN photo_tag_link l
					ON p.PH_ID = l.PH_ID
				LEFT JOIN tags t
					ON l.TAG_ID = t.TAG_ID
				LEFT JOIN users u
					ON p.UID = u.UID
				LEFT JOIN (
					SELECT 1 AS wishlisted, w.PH_ID 
					FROM wishlist w
					WHERE w.UID = %d AND w.PH_ID = %d
				) wl 
					ON wl.PH_ID = p.PH_ID
				GROUP BY p.PH_ID", $photoid, $uidstr, $photoid);
		} else {
			$dbQuery = sprintf("
				SELECT p.PH_ID AS photoid, p.url, X(p.lat_lng) AS latitude, Y(p.lat_lng) AS longitude, p.altitude, p.direction, p.timestamp, p.popularity, u.username, null AS wishlisted, GROUP_CONCAT(t.text) AS tags 
				FROM (
					SELECT * 
					FROM photos 
					WHERE PH_ID = %s
				) p
				LEFT JOIN photo_tag_link l
					ON p.PH_ID = l.PH_ID
				LEFT JOIN tags t
					ON l.TAG_ID = t.TAG_ID
				LEFT JOIN users u
					ON p.UID = u.UID
				GROUP BY p.PH_ID", $photoid);
		}
		$result=getDBResultRecord($dbQuery);
		header("Content-type: application/json");
		echo json_encode($result);
	}

	# Adds a photo to the db
	function addPhoto($url, $timestamp, $latitude, $longitude, $altitude, $direction, $username, $tags) {
		if (empty($altitude))
			$altitude = "NULL";
		if (empty($direction))
			$direction = "NULL";
		
		# Get the UID for the selected username
		$uidstr = "NULL";
		if (!empty($username)) {
			$dbQuery = sprintf("
				SELECT UID 
				FROM users 
				WHERE username = '%s'", 
				$username);
			$result = getDBResultRecord($dbQuery);
			$uidstr = $result['UID'];
		}
		
		$dbQuery = sprintf("
			INSERT INTO photos (url, timestamp, lat_lng, altitude, direction, UID) 
			VALUES ('%s', '%s', POINT(%s, %s), %s, %s, %s)", mysql_real_escape_string($url), $timestamp, $latitude, $longitude, $altitude, $direction, $uidstr);
		
		$insertResult = getDBResultInserted($dbQuery, "newPhotoId");
		$newPhotoId = $insertResult["newPhotoId"];
		
		# Add tag fields only if nonempty
		if (!empty($tags)) {
			$tag_list = explode(',',$tags);
			
			# check that tags are in the db, or add them as new ones
			$dbQuery = "INSERT IGNORE INTO tags (text) VALUES ('".implode("'),('",$tag_list)."')";
			$result = getDBResultInserted($dbQuery);
			
			# associate the tags with the new photo id
			$quoted_list = "'".implode("','",$tag_list)."'";
			$dbQuery = "
				INSERT INTO photo_tag_link (TAG_ID, PH_ID) (
					SELECT TAG_ID, {$newPhotoId} AS PH_ID 
					FROM tags
					WHERE text IN ({$quoted_list})
				)";
			$result = getDBResultInserted($dbQuery);
		}
		
		header("Content-type: application/json");
		echo json_encode($insertResult);
	}

	# Increments the popularity of a photo
	function incrementPopularity($photoid) {
		$dbQuery = sprintf("
			UPDATE photos
			SET popularity = popularity + 1
			WHERE PH_ID = %d", $photoid);
		$result = getDBResultAffected($dbQuery);
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
?>

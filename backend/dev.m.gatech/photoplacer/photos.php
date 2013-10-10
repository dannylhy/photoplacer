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
	function getPhoto($photoid) {
		$dbQuery = sprintf("
			SELECT p.PH_ID AS photoid, p.url, p.latitude, p.longitude, p.altitude, p.direction, p.timestamp, p.popularity, u.username 
			FROM photos p
			INNER JOIN users u
			WHERE p.UID = u.UID AND p.PH_ID = %d", $photoid);
		$result=getDBResultRecord($dbQuery);
		header("Content-type: application/json");
		echo json_encode($result);
	}

	# Adds a photo to the db
	function addPhoto($url, $latitude, $longitude, $altitude, $direction, $username, $tags) {
		$altitude = !empty($altitude) ? "'$altitude'" : "NULL";
		$direction = !empty($direction) ? "'$direction'" : "NULL";
		
		$uidstr = "NULL";
		
		if (!empty($username)) {
			$dbQuery = sprintf("
				SELECT UID 
				FROM users 
				WHERE username = '%s'", 
				$username);
			var_dump($dbQuery);
			$result = getDBResultRecord($dbQuery);
			
			$uidstr = $result['UID'];
		}
		
		$dbQuery = sprintf("
			INSERT INTO photos (url, latitude, longitude, altitude, direction, UID) 
			VALUES (%s , %f, %f, %s, %s, %s);", $url, $latitude, $longitude, $altitude, $direction, $uidstr);
		$result = getDBResultInserted($dbQuery, $newPhotoId);
		
		var_dump($result); #debug

/*		
		# Add tag fields only if nonempty
		if (!empty($tags)) {
			$tag_list = explode(',',$tags);
			
			# check that tags are in the db, or add them as new ones
			$dbQuery = "INSERT OR IGNORE INTO tags (text) VALUES ";
			foreach ($tag in $tag_list) {
				$dbQuery .= "('{$tag}') ";
			}
			$result = getDBResultRecord($dbQuery);
			
			# associate the tags with the new photo id
			$dbQuery = "
				INSERT INTO photo_tag_link (TAG_ID, PH_ID) 
					SELECT TAG_ID, {$newPhotoId} AS PH_ID 
					FROM tags
					WHERE text IN ({$tag_list})
				";
			$result = getDBResultInserted($dbQuery);
		}
*/		
		header("Content-type: application/json");
		echo json_encode($result);
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

<?php
	include 'db_helper.php';
	include 'system_params.php';
	
	# Gets all wishlisted photos for a given username
	# Returns JSON of (photo_id, wishlist_id)
	function getWishlist($username) {
		if ($username == "") {
			echo "Error. No username entered";
			return;
		}
		#$dbQuery = sprintf("SELECT p.PH_ID AS photoid, p.url, p.latitude, p.longitude, p.altitude, p.direction, p.timestamp, p.popularity, w.WID 
		#	FROM photos p 
		#	INNER JOIN wishlist w ON p.PH_ID = w.PH_ID 
		#	INNER JOIN users u ON w.UID = u.UID 
		#	WHERE u.username = '%s'",$username);
		
		$dbQuery = sprintf("SELECT w.PH_ID AS photoid, w.WID AS w_id 
			FROM wishlist w 
			INNER JOIN users u ON w.UID = u.UID 
			WHERE u.username = '%s'", $username);
		$result = getDBResultsArray($dbQuery);
		
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	# Gets the details about a specific wishlist entry
	function getWishlistEntry($username, $w_id) {
		if ($username == "") {
			echo "Error. No username entered";
			return;
		}
		$dbQuery = sprintf("
				SELECT UID 
				FROM users 
				WHERE username = '%s'", $username);
			$result = getDBResultRecord($dbQuery);

		$dbQuery = sprintf("
			SELECT p.PH_ID AS photoid, p.url, p.latitude, p.longitude, p.altitude, p.direction, p.timestamp, p.popularity, w.WID AS w_id
			FROM photos p 
			INNER JOIN wishlist w ON p.PH_ID = w.PH_ID 
			INNER JOIN users u ON w.UID = u.UID 
			WHERE u.username = '%s' AND w.WID = '%d'", $username, $w_id);
		#$dbQuery = sprintf("SELECT PH_ID AS photoid, WID AS w_id 
		#	FROM wishlist 
		#	WHERE WID = '%d'", $w_id);
		$result = getDBResultRecord($dbQuery);
		
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	# Adds a new wishlist entry based on photo id
	function addWishlistEntry($username, $photoid) {
		if ($username == "") {
			echo "Error. No username entered";
			return;
		}
		
		$dbQuery = sprintf("
			INSERT INTO wishlist (PH_ID, UID) 
			VALUES (%d , (
				SELECT UID 
				FROM users 
				WHERE username = '%s'
			));", $photoid, $username);
		$result = getDBResultInserted($dbQuery,"newWishlistId");
		
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	# Deletes an entry from the wishlist
	function deleteWishlistEntry($username, $w_id) {
		if ($username == "") {
			echo "Error. No username entered";
			return;
		}
		
		$dbQuery = sprintf("
			DELETE FROM wishlist 
			WHERE WID = %d AND UID = (
				SELECT UID 
				FROM users 
				WHERE username = '%s'
			);", $w_id, $username);
		$result = getDBResultAffected($dbQuery);
		
		header("Content-type: application/json");
		echo json_encode($result);
	}

?>

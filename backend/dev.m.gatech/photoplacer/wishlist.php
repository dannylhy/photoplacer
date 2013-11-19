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
		$dbQuery = sprintf("SELECT p.PH_ID AS photoid, p.url, X(p.lat_lng) AS latitude, Y(p.lat_lng) AS longitude, p.altitude, p.direction, p.timestamp, p.popularity, w.WID 
			FROM photos p 
			INNER JOIN wishlist w ON p.PH_ID = w.PH_ID 
			INNER JOIN users u ON w.UID = u.UID 
			WHERE u.username = '%s'",$username);
		
		#$dbQuery = sprintf("SELECT w.PH_ID AS photoid, w.WID AS w_id 
		#	FROM wishlist w 
		#	INNER JOIN users u ON w.UID = u.UID 
		#	WHERE u.username = '%s'", $username);
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
			SELECT p.PH_ID AS photoid, w.WID AS w_id, p.url, X(p.lat_lng) AS latitude, Y(p.lat_lng) AS longitude, p.altitude, p.direction, p.timestamp, p.popularity, u.username, GROUP_CONCAT(t.text) AS tags 
			FROM (
				SELECT * 
				FROM wishlist 
				WHERE WID = '%d'
			) w
			INNER JOIN photos p ON w.PH_ID = p.PH_ID
			LEFT JOIN photo_tag_link l
				ON p.PH_ID = l.PH_ID
			LEFT JOIN tags t
				ON l.TAG_ID = t.TAG_ID
			LEFT JOIN users u
				ON w.UID = u.UID
			WHERE u.username = '%s'
			GROUP BY p.PH_ID
			", $w_id, $username);
		/*
		$dbQuery = sprintf("SELECT PH_ID AS photoid, WID AS w_id 
			FROM wishlist 
			WHERE WID = '%d'", $w_id);
		*/
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
	/*
	function checkPermission($id) {
		global $_USER;
		$user = $_USER["uid"];
		$dbQuery = sprintf("SELECT username from users where username = '%s'",
					mysql_real_escape_string($id));
		$result = getDBResultRecord($dbQuery);
		if ($result["user"] != $user) {
			$GLOBALS["_PLATFORM"]->sandboxHeader('HTTP/1.1 401 Unauthorized');
			die();
		}
	}
	*/
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

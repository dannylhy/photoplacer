<?php
	include 'db_helper.php';
	include 'system_params.php';
	
	function getTopLocations() {
		$dbQuery = sprintf("SELECT `latitude`, `longitude`, `photocount`, `LID_1` AS id FROM locations_zoomout ORDER BY `photocount` DESC");
		$result = getDBResultsArray($dbQuery);
		error_log("failed");
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	function getBoundLocation($sw_lat, $sw_lng, $ne_lat, $ne_lng) {
		if ($ne_lng == "") {
			echo "4 parameters are needed, the parameters are sw_lat, sw_lng, ne_lat, ne_lng";
			return;
		}
		
		$dbQuery = sprintf("SELECT `latitude`, `longitude`, `photocount`, `LID_1` AS id FROM locations_zoomout 
			WHERE `latitude` >= %s AND `longitude` >= %s AND `latitude` <= %s AND `longitude` <= %s ORDER BY `photocount` DESC", $sw_lat, $sw_lng, $ne_lat, $ne_lng);
		$result=getDBResultRecord($dbQuery);
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	function getZoomedLocationsById($lid1) {
		$dbQuery = sprintf("SELECT `latitude`, `longitude`, `photocount`, `LID_2` AS id FROM locations_zoomin WHERE `LID_1` = %s ORDER BY `photocount` DESC", $lid1);
		$result = getDBResultsArray($dbQuery);
		error_log("failed");
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	function getPhotosAtZoomedLocation($lid1, $lid2) {
		$dbQuery = sprintf("SELECT `latitude`, `longitude`, `filename`, `popularity`, `PH_ID` AS id FROM photos WHERE `LID_1` = %d ", $id);
		$result = getDBResultsArray($dbQuery);
		error_log("failed");
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	
	
	function addComment($comment) {
		global $_USER;
		$user = $_USER["uid"];
		$dbQuery = sprintf("INSERT INTO usercomments (comment, user) VALUES ('%s', '%s')",
			mysql_real_escape_string($comment), mysql_real_escape_string($user));
	
		$result = getDBResultInserted($dbQuery,'personId');
		
		header("Content-type: application/json");
		echo json_encode($result);
	}

	function checkCommentPermission($id) {
		global $_USER;
		$user = $_USER["uid"];
		$dbQuery = sprintf("SELECT user from usercomments where id = '%s'",
					mysql_real_escape_string($id));
		$result = getDBResultRecord($dbQuery);
		if ($result["user"] != $user) {
			$GLOBALS["_PLATFORM"]->sandboxHeader('HTTP/1.1 401 Unauthorized');
			die();
		}
	}

	function updateComment($id,$comment) {

		checkCommentPermission($id);
		$dbQuery = sprintf("UPDATE usercomments SET comment = '%s' WHERE id = '%s'",
			mysql_real_escape_string($comment),
			mysql_real_escape_string($id));
		
		$result = getDBResultAffected($dbQuery);
		
		header("Content-type: application/json");
		echo json_encode($result);
	}
	
	function deleteComment($id) {
		checkCommentPermission($id);
		$dbQuery = sprintf("DELETE FROM usercomments WHERE id = '%s'",
			mysql_real_escape_string($id));												
		$result = getDBResultAffected($dbQuery);
		
		header("Content-type: application/json");
		echo json_encode($result);
	}

	function listUsers() {
		$dbQuery = sprintf("SELECT DISTINCT(user) from usercomments");
		$result = getDBResultsArray($dbQuery);
		error_log("test");
		header("Content-type: application/json");
		echo json_encode($result);
	}

	function getUserComment($user, $id) {
		$dbQuery = sprintf("SELECT id,comment FROM usercomments WHERE user = '%s' AND id = '%s'",
			mysql_real_escape_string($user), mysql_real_escape_string($id));
		$result=getDBResultRecord($dbQuery);
		header("Content-type: application/json");
		echo json_encode($result);
	}

	function listUserComments($user, $id) {
		$dbQuery = sprintf("SELECT id,comment FROM usercomments WHERE user = '%s'",
			mysql_real_escape_string($user));
		$result=getDBResultsArray($dbQuery);
		header("Content-type: application/json");
		echo json_encode($result);
	}
?>

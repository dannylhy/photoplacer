/* ON READY */

$(document).ready(function initialize() {

	$("#wishLink").click(showWishlist);
	
	$("#uploadPhoto").change(photoUpload);

	initializeMap();
});

/* GLOBALS */

var Map; // Reference to the Google API Map
var Markers = []; // Markers being processed
var PrevMarkerID = 0; // Marker ID for the previous zoom level
var Level = 0; // Zoom level

/* FUNCTIONS */

// Create Google Map and display markers for photos
function initializeMap() {
	mapOptions = {
        center: new google.maps.LatLng(33.776454, -84.397647),
        zoom: 17,
        zoomControl: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
	Map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	console.log("Map Initialized.");
	
    showMapMarkers();
}

/* MARKERS */

// Retrieve and display the level 0 map markers
function showMapMarkers() {
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map",
        context: document.body,
        success: function(data) {
			console.log("getMapMarkers() AJAX successful.");
			
			var dataMarkers = data;
			
			for (var i = 0; i < dataMarkers.length; i++)
			{
				addMapMarker(dataMarkers[i]);
			}
        }
    });
}

// Add a marker to the map according to the data
function addMapMarker(dataMarker) {
    var mapMarker = new google.maps.Marker({
        position: new google.maps.LatLng(dataMarker.latitude, dataMarker.longitude),
        map: Map                         
    });
   
	Markers.push(mapMarker);
    
	var photoCountString = dataMarker.photocount.toString();		     
	var photoCountIW = new google.maps.InfoWindow({content: photoCountString});
			 
	google.maps.event.addListener(mapMarker, 'mouseover', function() {
		photoCountIW.open(Map, mapMarker);
	}); 
	
	// Base display level
	if (0 == Level) {
		google.maps.event.addListener(mapMarker, 'click', function() {
			Map.setZoom(20);
			Map.setCenter(mapMarker.getPosition());
			clearOverlays();
			Level = 1;
			PrevMarkerID = dataMarker.id;
			showMapZoomMarkers(dataMarker);
		});
	}
	
	// Zoomed display level
	if (1 == Level) {
		popOutPhoto(dataMarker, mapMarker);
	}  
}

// Requests the markers of the zoomed portion and shows them
function showMapZoomMarkers(dataMarker) {
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/" + dataMarker.id + "/zoom",
		context: document.body,
		success: function(data) {
			console.log("mapZoomIndex() AJAX success.");
			
			var dataMarkers = data;
			
			for (var i = 0; i < dataMarkers.length; i++)
			{
				addMapMarker(dataMarkers[i]);
			}
		}
	}); 
}

// Display an InfoWindow popout with the most popular photo
// Show list of photos at last level
function popOutPhoto(dataMarker, mapMarker) {
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/" + PrevMarkerID + "/zoom/" + dataMarker.id,
		context: document.body,
		success: function(data) {
			console.log("popOutPhoto() AJAX successful.");
			console.log("API url: " + "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/" + PrevMarkerID + "/zoom/" + dataMarker.id);
			//var parsedData = jQuery.parseJSON(data);
			var parsedData = data;
						
			var firstPhoto = parsedData[0];
			
			var popPhotoString = '<div>' +
			'<a href="#"> <img src="' + firstPhoto.url + '" width="150" height="150"> </a>' +
			'</div>';
		
			var popPhotoIW = new google.maps.InfoWindow({
				content: popPhotoString
			});
			
			google.maps.event.addListener(mapMarker, 'click', function() {				
				console.log("popPhotoIW marker event.");
		
				// Retrieve a list of photos for the given marker
				$.ajax({
					url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/" + PrevMarkerID + "/zoom/" + dataMarker.id,
					context: document.body,
					success: function(data) {
						console.log("getPopularPhotos() AJAX success.");
						console.log("API url: " + "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/" + PrevMarkerID + "/zoom" + dataMarker.id);
						
						//var photos = jQuery.parseJSON(data);
						var photos = data;
						
						console.log(photos);
						
						$("#map-canvas").css('display', 'none');
						$("#photoList").css('display', 'inline');
						
						showPhotoList(photos, "PhotoListPhotos");
						
						$(".wishButton").attr('value', 'Add to Wishlist');
						
					}
				});
				
				popPhotoIW.open(Map, mapMarker);
			});
		}
	});
}

/* PHOTO UPLOAD */

// Upload a photo to Imgur (photo given by user)
// Extract information and POST to Danny's API
function photoUpload(evt) {

	console.log("PhotoUpload button clicked.");
	
	var file = evt.target.files[0];
	//console.log("File: " + file);
	
	if (!file || !file.type.match(/image.*/))
	{
		console.log("File uploaded is not a valid image file.");
		return;
	}
	
	document.body.className = "uploading";
	
	// This is all probably very insecure, but my group members didn't want to do this the proper way (you know, like, server-side, or getting location data from a mobile device... since this supposedly is a mobile app...).
	//var data = {'url': link, 'latitude': '1.4', 'longitude': '2.5', 'altitude': null, 'direction': null, 'timestamp': '2013-10-10 13:27:00'};
	
	// This will be sent to 
	var data = {};
	
	var FR = new FileReader();
	
	FR.onload = function (evt) {
		try {
			var exif = new ExifReader();
			exif.load(evt.target.result);
			
			// Get EXIF Data
			var EXIFData = exif.getAllTags();
			console.log(EXIFData);
			
			if (EXIFData.DateTimeOriginal && EXIFData.DateTimeOriginal.description) {
				// Parse since wrong format for our PHP backend. '2013:11:19 18:51:17' -> '2013-11-19 18:51:17'
				var description = EXIFData.DateTimeOriginal.description;
					
				description = description.replace(":", "-");
				description = description.replace(":", "-");
				
				data.timestamp = description;
			} else
				data.timestamp = '2000-01-01 00:00:00';
			
			if (EXIFData.GPSLatitude && EXIFData.GPSLatitude.description) {
				if (EXIFData.GPSLatitudeRef && EXIFData.GPSLatitudeRef.description) {
					if ("North latitude" == EXIFData.GPSLatitudeRef.description)
						data.latitude = EXIFData.GPSLatitude.description;
					else if ("South latitude" == EXIFData.GPSLatitudeRef.description)
						data.latitude = -EXIFData.GPSLatitude.description;
					else
						data.latitude = EXIFData.GPSLatitude.description;
				} else
					data.latitude = EXIFData.GPSLatitude.description;
			} else
				data.latitude = 0.0;
				
			if (EXIFData.GPSLongitude && EXIFData.GPSLongitude.description) {
				if (EXIFData.GPSLongitudeRef && EXIFData.GPSLongitudeRef.description) {
					if ("East longitude" == EXIFData.GPSLongitudeRef.description)
						data.longitude = EXIFData.GPSLongitude.description;
					else if ("West longitude" == EXIFData.GPSLongitudeRef.description)
						data.longitude = -EXIFData.GPSLongitude.description;
					else
						data.longitude = EXIFData.GPSLongitude.description;
				} else
					data.longitude = EXIFData.GPSLongitude.description;
			} else
				data.longitude = 0.0;
			
			console.log("data: " + data);
			console.log("timestamp: " + data.timestamp);
			console.log("latitude: " + data.latitude);
			console.log("longitude: " + data.longitude);
			
		}
		catch (error) {
				alert(error);
		}
	}
	
	FR.readAsArrayBuffer(file);
	
	// Upload File to Imgur
	/*
	var fd = new FormData(); 
    fd.append("image", file);
        
	var xhr = new XMLHttpRequest(); 
    xhr.open("POST", "https://api.imgur.com/3/image.json"); 
        xhr.onload = function() {
			console.log("PhotoUpload() AJAX successful IMGUR POST.");
			var link = JSON.parse(xhr.responseText).data.link
            console.log("link: " + link);
            document.body.className = "uploaded";
			
			// Construct data object to send
			//var data = {'url': link, 'latitude': '1.4', 'longitude': '2.5', 'altitude': null, 'direction': null, 'timestamp': '2013-10-10 13:27:00'};
			data.url = link;
			
			// Post URL to PhotoPlacer API
			$.ajax({
				url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/photo",
				context: document.body,
				//data: data,				
				data: {'url': link, 'latitude': '1.4', 'longitude': '2.5', 'altitude': null, 'direction': null, 'timestamp': '2013-10-10 13:27:00'},
				type: 'POST',
				success: function(data) {
					console.log("PhotoUpload() AJAX successful API POST.");
					alert("Your photo has been uploaded!");
				}
			});
        }
        
    xhr.setRequestHeader('Authorization', 'Client-ID 6f94f078334088f');
	xhr.send(fd);
	*/
}

/* WISHLIST */

// Show the wishlist
function showWishlist() {
	console.log("WishList clicked");
	
	$("#map-canvas").css('display', 'none');
	$("#photoList").css('display', 'none');
	$("#wishList").css('display', 'inline');
	
	$("#NavBarLoc").text(">").append('\xA0').append('\xA0').append('\xA0')
		.append('\xA0').append('\xA0').append("Wishlist");
	$("#wishLink").css('display', 'none');
	
	// Retrieve a list of photos for the given marker
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/wishlist",
		context: document.body,
		success: function(data) {
			console.log("wishList index AJAX success.");
			
			//var photos = jQuery.parseJSON(data);
			var photos = data;
					
			showPhotoList(photos, "WishListPhotos");
		}
	});
	
	$("#wishList").css('display', 'inline');
}

// Add a given photo to the user's wishlist
function addPhotoToWishlist(photo, ID) {
	console.log("Adding photo " + photo + " to wishlist...");
	
	// POST photo to user's wishlist
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/wishlist",
		context: document.body,		
		data: {'photoid': photo.photoid},
		type: 'POST',
		success: function(data) {
			console.log("addPhotoToWishlist() AJAX successful API POST.");
			alert("Photo added to your wishlist.");
			
			// Change buttons
			$("#wishButton" + ID).css('display', 'none');
			$("#remWishButton" + ID).css('display', 'inline');
		},
		error: function(data) {
			alert("Couldn't add photo to wishlist.");
		}
	});
	
	
	
	// UPDATE popularity of the photo wishlisted (PUT)
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/photo/" + photo.photoid,
		context: document.body,
		headers: {'X-HTTP-Method-Override': 'PUT'},
		type: 'POST',
		success: function(data) {
			console.log("addPhotoToWishlist() AJAX successful API PUT.");
		}
	});
}

// Remove a given photo from the user's wishlist
// ID is the ID of the attribute of the button clicked
function deletePhotoFromWishlist(photo, ID) {
	console.log("Deleting photo " + photo.WID + " from wishlist...");
	
	// DELETE photo from user's wishlist
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/wishlist/" + photo.WID,
		context: document.body,
		//type: 'DELETE',
		type: 'POST',
		headers: {'X-HTTP-Method-Override': 'DELETE'},
		success: function(data) {
			console.log("deletePhotoFromWishlist() AJAX successful API DELETE.");
			alert("Photo removed from your wishlist.");

			// Change buttons
			$("#remWishButton" + ID).css('display', 'none');
			$("#wishButton" + ID).css('display', 'inline');
		},
		error: function(data) {
			alert("Couldn't delete photo from wishlist.");
		}
	});
}

/* OTHER */

// Helper function, display photos and their information on a given element
// Creates anchors to other functions
// var photos should hold an array of photo objects (Danny's API format) to display
// var elementID should hold the string of the element to append the photos to
function showPhotoList(photos, elementID)
{
	for (var i = 0; i < photos.length; i++) {
		var curPhoto = photos[i];
		var buttonsToAppend = ""; // HTML for buttons to append
		
		if ("WishListPhotos" == elementID) {
			buttonsToAppend = "<input class=\"wishButton\" id=\"wishButton" + i + "\" type=\"button\" value=\"Add to Wishlist\" style=\"display: none; float: left;\"/>" +
			"<input class=\"remWishButton\" id=\"remWishButton" + i + "\" type=\"button\" value=\"Remove from Wishlist\" style=\"display: inline; float: left;\"/>";
		} else if ("PhotoListPhotos" == elementID) {
			if (null != photos.wishlisted) {
				buttonsToAppend = "<input class=\"wishButton\" id=\"wishButton" + i + "\" type=\"button\" value=\"Add to Wishlist\" style=\"display: none;\"/>" +
				"<input class=\"remWishButton\" id=\"remWishButton" + i + "\" type=\"button\" value=\"Remove from Wishlist\" style=\"display: inline;\"/>";
			} else {
				buttonsToAppend = "<input class=\"wishButton\" id=\"wishButton" + i + "\" 	type=\"button\" value=\"Add to Wishlist\" style=\"display: inline;\"/>" +
				"<input class=\"remWishButton\" id=\"remWishButton" + i + "\" type=\"button\" value=\"Remove from Wishlist\" style=\"display: none;\"/>";
			}
		} else {
			console.log("Not a wishlist or photolist.");
		}
		
		$("#" + elementID).append(
			"<li class=\"IMG\">" +
			"<a href=\"" + curPhoto.url + "\">" +
			"<img style=\"float: left; margin-right: 20px; margin-bottom: 0px;\" src=\"" + curPhoto.url + "\" width=\"300\" height=\"300\"></a>" +
			"<p>Popularity: " + curPhoto.popularity + "</p>" +
			"<p>Latitude: " + curPhoto.latitude + "</p>" +
			"<p>Longitude: " + curPhoto.longitude + "</p>" +
			"<p>Direction: " + curPhoto.direction + "</p>" +
			"<p>Timestamp: " + curPhoto.timestamp + "</p>" +
			buttonsToAppend + // Buttons HTML
			"</li>"
		);
	}
	
	var IDpattern = new RegExp("[0-9]+");
	
	$(".wishButton").click(function() { 
		var buttonID = $(this).attr("id");
		console.log("WishlistButtonID: " + buttonID);
		
		var ID = IDpattern.exec($(this).attr("id"));
		
		//var ID = $(this).attr("id").substring(10, 11);
		console.log("General ID: " + ID);
		
		addPhotoToWishlist(photos[ID], ID); // Buttons changed if call is successful
	});
	
	$(".remWishButton").click(function() {
		var buttonID = $(this).attr("id");
		console.log("RemWishlistButtonID: " + buttonID);
		
		var ID = IDpattern.exec($(this).attr("id"));
		
		//var ID = $(this).attr("id").substring(13, 14);
		console.log("General ID: " + ID);
		
		deletePhotoFromWishlist(photos[ID], ID); // Buttons changed if call is successful
	});
}

// ?
function clearOverlays() {
	for (var i = 0; i < Markers.length; i++ ) {
		Markers[i].setMap(null);
	}
	
	Markers = [];
}
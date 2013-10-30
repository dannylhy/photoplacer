/* ON READY */

$(document).ready(function initialize() {

	$("#wishLink").click(function() {
		console.log("WishList clicked");
		
		$("#map-canvas").css('display', 'none');
		$("#photoList").css('display', 'none');
		$("#wishList").css('display', 'inline');
		
		$("#NavBarLoc").text(">    Wishlist");
		$("#wishLink").css('display', 'none');
		
		// Retrieve a list of photos for the given marker
		$.ajax({
			url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/wishlist",
			context: document.body,
			success: function(data) {
				console.log("wishList index AJAX success.");
				
				//var photos = jQuery.parseJSON(data);
				var photos = data;
						
				for (var i = 0; i < photos.length; i++) {
					var url = photos[i].url;
					
					$("#WishListPhotos").append( 
						"<li>" +				
						"<a href=\"" + url + "\">" +
						"<img src=\"" + url + "\" width=\"150\" height=\"150\"></a>" +
						"</li>"
					);
				}
			}
		});
		
		$("#wishList").css('display', 'inline');
	});
	
	$("#uploadPhoto").change(photoUpload);

	initializeMap();
});

/* GLOBALS */

var Map; // Reference to the Google API Map
var Markers = []; // Markers being processed
var PrevMarkerID = 0; // Marker ID for the previous zoom level
var Level = 0; // Zoom level

/* FUNCTIONS */

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
			
			//var markers = jQuery.parseJSON(data);
			var dataMarkers = data;
			
			//createMapMarkers(dataMarkers);
			for (var i = 0; i < dataMarkers.length; i++)
			{
				addMapMarker(dataMarkers[i]);
			}
        }
    });
}
 
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
	
	if (1 == Level) {
		popOutPhoto(dataMarker, mapMarker);
	}  
}


// Requests the markers of the zoomed portion
function showMapZoomMarkers(dataMarker) {
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/" + dataMarker.id + "/zoom",
		context: document.body,
		success: function(data) {
			console.log("mapZoomIndex() AJAX success.");
			
			//var dataMarkers = jQuery.parseJSON(data);
			var dataMarkers = data;
			
			//PrevMarkerID = dataMarker.id;
			
			//createMapMarkers(dataMarkers);
			for (var i = 0; i < dataMarkers.length; i++)
			{
				addMapMarker(dataMarkers[i]);
			}
		}
	}); 
}

// Display an InfoWindow popout with the most popular photo
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
						console.log("API url: " + "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/" + PrevMarkerID + "/zoom");
						
						//var photos = jQuery.parseJSON(data);
						var photos = data;
						
						console.log(photos);
						
						$("#map-canvas").css('display', 'none');
						$("#photoList").css('display', 'inline');
						
						for (var i = 0; i < photos.length; i++) {
							var url = photos[i].url;
							
							$("#PhotoListPhotos").append( 
								"<li>" +				
								"<a href=\"" + url + "\">" +
								"<img src=\"" + url + "\" width=\"150\" height=\"150\"></a>" +
								"</li>"
							);
						}

						/*
						document.write("<div id = \"photoList\">" +
							"<ul style=\"list-style: none;\">");
						
						for (var i = 0; i < photos.length; i++) {
							var url = photos[i].url;
							document.write("<li>" +				
								"<a href=\"" + url + "\">" +
								"<img src=\"" + url + "\" width=\"150\" height=\"150\"></a>" +
								"</li>");
						}
						
						document.write("</ul>");
						*/
					}
				});
				
				popPhotoIW.open(Map, mapMarker);
			});
		}
	});
}

function photoUpload(evt) {

	console.log("PhotoUpload button clicked.");
	
	var file = evt.target.files[0];
	console.log("File: " + file);
	
	if (!file || !file.type.match(/image.*/))
	{
		console.log("File uploaded is not a valid image file.");
		return;
	}
	
	document.body.className = "uploading";
	
	// Upload File to Imgur
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
			var data = {
				url: link,
				latitude: null,
				longitude: null,
				altitude: null,
				timestamp: null
			};
			
			// Post URL to PhotoPlacer API
			$.ajax({
				url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/photo",
				context: document.body,
				//data: data,				
				data: {'url': link, 'latitude': null, 'longitude': null, 'altitude': null, 'timestamp': null},
				type: 'POST',
				success: function(data) {
					console.log("PhotoUpload() AJAX successful API POST.");
				}
			});
        }
        
    xhr.setRequestHeader('Authorization', 'Client-ID 8a8067ff1cd7a8d');
	xhr.send(fd);
}

function updatePopularity(id) {
    $.ajax({
        url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/photo/"+id,
        context: document.body,
        data: {'photoid': id},
        headers: {'X-HTTP-Method-Override': 'PUT'},
        type: 'POST',
        success: function(data) {
			console.log("updatePopularity() AJAX success.");
        }
    });
}

/* OTHER */
 
function clearOverlays() {
	for (var i = 0; i < Markers.length; i++ ) {
		Markers[i].setMap(null);
	}
	
	Markers = [];
}

/* DISCARDED */

/*
function createMapMarkers(dataMarkers) {
	for (var j = 0; j < dataMarkers.length; j++) {	
		addMapMarker(dataMarkers[j]);
	}
}
*/
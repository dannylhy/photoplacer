/* ON READY */

$(document).ready(function initialize() {      
	initializeMap();
	
	$("#photoList").append("<p>Test</p>");
	
	$("#photoList").append("<p>Test</p>");
});

/* GLOBALS */

var Map; // Reference to the Google API Map
var Markers = []; // Markers being processed
var PrevMarkerID = 0; // Marker ID for the previous zoom level
var Level = 0; // Zoom level

// Managing marker photos display
var IWMapMarkerID = 0;
var IWMapZoomMarkerID = 0;

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
			'<a href="photo.html"> <img src="' + firstPhoto.url + '" width="150" height="150"> </a>' +
			'</div>';
		
			var popPhotoIW = new google.maps.InfoWindow({
				content: popPhotoString
			});
			
			google.maps.event.addListener(mapMarker, 'click', function() {				
				console.log("popPhotoIW marker event.");
				
				//IWMapMarkerID = 0;
				IWMapZoomMarkerID = dataMarker.id;
				
				$("#PhotoListPhotos").append("<li>" +
					"<a href=\"http://i.imgur.com/iZVfXgJ.jpg\">" +
					"<img src=\"http://i.imgur.com/iZVfXgJ.jpg\" width=\"150\" height=\"150\">" +
					"</a> </li>");
					
				$("#PhotoListPhotos").append("<p>Test</p>");
				
				$("#photoList").empty();
				$("#photoList").append("<p>Test</p>");
				
				popPhotoIW.open(Map, mapMarker);
			});
		}
	});
}

function getPopularPhotos(id) {
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/" + PrevMarkerID + "/zoom/" +id,
		context: document.body,
		success: function(data) {
			console.log("getPopularPhotos() AJAX success.");
            //var photos = jQuery.parseJSON(data);
			var photos = data;

			window.location = "photo.html" ;
			for (i = 0; i < photos.length; i++){
			document.write("<img src=\"" + photos[i].url + "\"> <p></p>");
			//$("#photo_list").html("<img src=\"" + photos[i].url + "\"> <p>hello test text</p>");
			}
		}
	});
}

// WishlistIndex
function getWishlistPhotos() {
	$.ajax({
		url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/wishlist/",
		context: document.body,
		success: function(data) {
			console.log("getWishlistPhotos() AJAX success.");
            //var photos = jQuery.parseJSON(data);
			var photos = data;
        
            //window.location = "photo.html" ;
            for(i = 0; i < photos.length; i++) {
                document.write("<img src=\"" + photos[i].url + "\"> <p></p>");
                //$("#photo_list").html("<img src=\"" + photos[i].url + "\"> <p>hello test text</p>");
            }
		}
	});
}

function photoUpload() {
	var newData = {'url': 'http://i.imgur.com/iZVfXgJ.jpg', 'timestamp':'2013-10-18 00:00:00', 'latitude':'0', 	'longitude':'0','altitude':'0', 'direction':'0'};
    
    $.ajax({
        url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/photo",
        data: newData,
        context: document.body,
        type: 'POST',
        success: function(data) {
			console.log("photoUpload AJAX success.");
        }
    });
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
$( document ).ready(function initialize() {
	
    $('#uploadPhoto').change(photoUpload);    
	initializeMap();
});

	var markers = [];
    var map;   
    var markersArray = [];
	var level = 0;
	var previd = 0;
	var photos = [];
	
function clearOverlays() {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
    
  }
  markersArray = [];
  
}

      function initializeMap() {
        mapOptions = {
          center: new google.maps.LatLng(33.776454,-84.397647),
          zoom: 17,
          zoomControl:false,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
         map = new google.maps.Map(document.getElementById("map-canvas"),  mapOptions);
         getMapMarkers();       
      }
      
     function getMapMarkers() {
   $.ajax({
        url: "http://dev.m.gatech.edu/d/rrao38/w/photoplacer/c/api/map",
        context: document.body,
        success: function(data) {
        markers = jQuery.parseJSON(data); 
                                  
     createMapMarker(markers);
        }
    });       
}

function createMapMarker(markers){
for(var j =0; j<markers.length;j++){
addMapMarker(markers[j]);
}
}
     
 function addMapMarker(markers){
    
    var marker = new google.maps.Marker({
	            position: new google.maps.LatLng(markers.latitude,markers.longitude),
           map: map
                            	        
	        });
	        markersArray.push(marker);
	         var photocountstring = markers.photocount.toString();		     
		       var infowindow = new google.maps.InfoWindow({content: photocountstring });
		     		        
		       google.maps.event.addListener(marker, 'mouseover', function() {
		           infowindow.open(map,marker);
		         }); 
		         if(level==0){
		         google.maps.event.addListener(marker, 'click', function() {
		             map.setZoom(20);
    				 map.setCenter(marker.getPosition());
    				 clearOverlays();
    				 level = 1;
    				 getZoomMapMarkers(markers.id);
		          }); 
		          }
		            if(level==1){
		         google.maps.event.addListener(marker, 'click', function() {
		             map.setZoom(20);
    				 map.setCenter(marker.getPosition());
    				 clearOverlays();
    				 level = 0;
    				 getPopularPhotos(markers.id);
		          }); 
		          
		          //return marker;
		          }
   
   }
    
     function getZoomMapMarkers(id) {
   $.ajax({
       url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/"+id+"/zoom",
 context: document.body,
 success: function(data) {
 markers = jQuery.parseJSON(data);   
      previd = id;
createMapMarker(markers);
 }
}); 
 }
 
function getPopularPhotos(id) {
   $.ajax({
       url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/map/"+previd+"/zoom/"+id,
 context: document.body,
 success: function(data) {
		photos = jQuery.parseJSON(data);
	
		window.location = "photo.html" ;
		for(i=0;i<photos.length; i++){
		document.write("<img src=\"" + photos[i].url + "\"> <p></p>");
		//$("#photo_list").html("<img src=\"" + photos[i].url + "\"> <p>hello test text</p>");
		}
 }
}); 
 }

function getWishlistPhotos(id) {
   $.ajax({
       url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/wishlist/",
 context: document.body,
 success: function(data) {
		photos = jQuery.parseJSON(data);
	
		//window.location = "photo.html" ;
		for(i=0;i<photos.length; i++){
			document.write("<img src=\"" + photos[i].url + "\"> <p></p>");
		//$("#photo_list").html("<img src=\"" + photos[i].url + "\"> <p>hello test text</p>");
		}
 }
}); 
 }

 
 function photoUpload() {
	console.log("hhhhh");
	updatePopularity(1); 
    $.ajax({
        url: "http://dev.m.gatech.edu/d/dlee399/w/photoplacer/c/api/photo",
        data: {'url': 'http://i.imgur.com/iZVfXgJ.jpg','latitude':'0','longitude':'0','altitude':'0','direction':'0','timestamp':'2013-10-18','popularity':'2'},
        context: document.body,
        type: 'POST',
        success: function(data) {
            console.log("success");
			//$('#main').html(data);
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
		console.log("Photo Put Success");
            //$('#PutResult').html(data);
        }
    });
}
 

//google.maps.event.addDomListener(window, 'load', initialize);
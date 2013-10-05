$( document ).ready(function initialize() {
	var mapOptions = {
		center: new google.maps.LatLng(33.778463, -84.398881),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
        
	var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
});

//google.maps.event.addDomListener(window, 'load', initialize);
$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  google.maps.event.addDomListener(window, 'load', initialize);
});

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(0, 0),
    zoom: 2
  };

  debugger;

  chicago = new google.maps.LatLng(41.850033, -87.6500523);

  var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  locationArray = [chicago]
  locationNameArray = ['Chicago']


  var marker = new google.maps.Marker({
      position: chicago,
      map: map,
      title:"Hello World!"
  });

  marker.setMap(map)
}


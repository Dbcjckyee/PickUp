$(document).ready(function() {
  $("a.showme").click(function(event){
    event.preventDefault();
    var lat = $(this).data('lat')
    var long = $(this).data('long')

    console.log(lat)
    console.log(long)
    // clearMarkers();
    clearOverlays();
    dropMarker(lat, long)
    map.setCenter(new google.maps.LatLng(lat, long))
  });

function clearOverlays() {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
  markersArray.length = 0;
}

function initMap() {
    // var myLatLng = {lat: 37.7749290, lng: -122.42};
    var map = new google.maps.Map(document.getElementById('mappp'), {
      zoom: 13,
      // center: myLatLng
    });

    return map;
  }
markersArray = [];
  var map = new initMap()
  navigator.geolocation.getCurrentPosition(function (position) {
  initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  map.setCenter(initialLocation)});


  // var marker = new google.maps.Marker({
  // map: map,
  // position: {lat: 37.7749290, lng: -122.42},
  // label: '!'
  // });

  function dropMarker(lati, longi){
    var marker = new google.maps.Marker({
    map: map,
    position: {lat: lati, lng: longi},
    label: '!'
    });
    markersArray.push(marker)
  }
  // function clearMarkers(){
  //   setMapOnAll(null);
  // }

});

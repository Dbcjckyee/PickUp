$(document).ready(function() {
  $("a.showme").click(function(event){
    event.preventDefault();
    var lat = $(this).data('lat')
    var long = $(this).data('long')
    $('div').removeClass("highlight")
    $(this).parent().parent().addClass("highlight")
    // debugger
    // console.log(lat)
    // console.log(long)
    // clearMarkers();
    clearOverlays();
    markersArray.push(dropMarker(lat, long, "?"))
    map.setZoom(13);
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
    // var sing = new google.maps.Map(document.getElementById('mappp'), {
    //   zoom: 13,
    //   // center: myLatLng
    // });

    return map;

  }

  google.maps.event.addDomListener(window, "load", initMap);

markersArray = [];

  var map = new initMap()
  navigator.geolocation.getCurrentPosition(function (position) {
  initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  dropMarker(position.coords.latitude, position.coords.longitude, "!")
  map.setCenter(initialLocation)});


  // var marker = new google.maps.Marker({
  // map: map,
  // position: {lat: 37.7749290, lng: -122.42},
  // label: '!'
  // });

  function dropMarker(lati, longi, symbol){
    var marker = new google.maps.Marker({
    map: map,
    position: {lat: lati, lng: longi},
    label: symbol
    });
    // markersArray.push(marker)
    return marker;
  }
  // function clearMarkers(){
  //   setMapOnAll(null);
  // }

  //   function cardBackground() {
  //   $("div:contains('Hello')").css('text-decortation', 'underline');
  // }

  // cardBackground();

});

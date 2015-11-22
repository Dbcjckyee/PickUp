$(document).ready(function() {
  $("a.showme").click(function(event){
    event.preventDefault();
    var lat = $(this).data('lat')
    var long = $(this).data('long')

    console.log(lat)
    console.log(long)

  });


function initMap() {
    // var myLatLng = {lat: 37.7749290, lng: -122.42};
    var map = new google.maps.Map(document.getElementById('mappp'), {
      zoom: 13,
      // center: myLatLng
    });

    return map;
  }

  var map = new initMap()
  navigator.geolocation.getCurrentPosition(function (position) {
  initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  map.setCenter(initialLocation)});


  var marker = new google.maps.Marker({
  map: map,
  position: {lat: 37.7749290, lng: -122.42},
  label: '!'
  });




});

$(document).ready(function() {
  var map = new google.maps.Map(document.getElementById('mappp'), {zoom: 13});
  var marker2 = new google.maps.Marker({map: map});
  $("a.showme").click(function(event){
    event.preventDefault();
    var lat = $(this).data('lat');
    var long = $(this).data('long');
    changeMarkerPosition(marker2, lat, long)
    map.setZoom(16);
    map.setCenter(new google.maps.LatLng(lat, long))
  });

  function changeMarkerPosition(tag, lat, lng) {
    var latlng = new google.maps.LatLng(lat, lng);
    tag.setPosition(latlng);
  }

  navigator.geolocation.getCurrentPosition(function(position){
    initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    var marker = new google.maps.Marker({
      map: map,
      position: {lat: position.coords.latitude, lng: position.coords.longitude},
      label: "!"
    });
    map.setCenter(initialLocation)
  });

});

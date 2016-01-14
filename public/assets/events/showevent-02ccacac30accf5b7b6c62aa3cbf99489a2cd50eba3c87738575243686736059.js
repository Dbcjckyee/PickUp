$(document).ready(function() {
  var map2 = new google.maps.Map(document.getElementById("map2"), {zoom:13});
  initialLocation = new google.maps.LatLng($('#event-info').data('latInfo'), $('#event-info').data('lngInfo'));
  map2.setCenter(initialLocation)
  var marker = new google.maps.Marker({
    map: map2,
    position: {lat: $('#event-info').data('latInfo'), lng: $('#event-info').data('lngInfo')},
    label: "*"
  })

});

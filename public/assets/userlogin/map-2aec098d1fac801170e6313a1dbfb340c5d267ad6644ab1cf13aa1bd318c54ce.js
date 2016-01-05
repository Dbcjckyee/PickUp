$(document).ready(function() {
  function initMap() {
    var mapOptions = {
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map2 = new google.maps.Map(document.getElementById("map2"), mapOptions);
    return map2
  }
  function dropEventMarker(lati, lngi) {
    var marker = new google.maps.Marker({
    map: map2,
    position: {lat: lati, lng: lngi},
    label: "*"})
  }
  map2 = new initMap()
  navigator.geolocation.getCurrentPosition(function (position) {
    initialLocation = new google.maps.LatLng($('#event-info').data('latInfo'), $('#event-info').data('lngInfo'));
    map2.setCenter(initialLocation)
  });
  dropEventMarker($('#event-info').data('latInfo'), $('#event-info').data('lngInfo'))
});

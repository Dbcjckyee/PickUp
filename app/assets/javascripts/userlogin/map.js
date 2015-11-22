$(document).ready(function() {
  function initMap() {
    var mapOptions = {
      // center: new google.maps.LatLng(),
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

     map2 = new google.maps.Map(document.getElementById("map2"), mapOptions);  
  dropEventMarker(lati,lngi)
     return map2

  }

  google.maps.event.addDomListener(window, "load", initMap);
  var lati = $('#event-info').data('latInfo')
  var lngi = $('#event-info').data('lngInfo')
  map2 = new initMap()

  navigator.geolocation.getCurrentPosition(function (position) {
    initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    map2.setCenter(initialLocation)
  });
  // console.log(lat)
  // console.log(lng)
  var eventLatLng = {lat: lati, lng: lngi}
  console.log(eventLatLng)

  function dropEventMarker(lati, lngi) {
    var marker = new google.maps.Marker({
    map: map2,
    position: {lat: lati, lng: lngi},
    label: "HELLO"})
  }


});
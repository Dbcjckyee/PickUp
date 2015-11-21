$(document).ready(function() {
    // var mapCanvas = document.getElementById('map');
    // var mapOptions = {
    //   center: new google.maps.LatLng(44.5403, -78.5463),
    //   zoom: 16,
    //   mapTypeId: google.maps.MapTypeId.ROADMAP
    // }
    // var map = new google.maps.Map(mapCanvas, mapOptions);
    // if (navigator.geolocation) {
    //     navigator.geolocation.getCurrentPosition(function (position) {
    //      initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    //      map.setCenter(initialLocation);
    //  });
    // }
  navigator.geolocation.getCurrentPosition(function (position) {
    console.log(position.coords.latitude)
  })
  function initMap() {
    // var myLatLng = {lat: 37.7749290, lng: -122.42};
    var map = new google.maps.Map(document.getElementById('map'), {
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
  label: 'DSJFLKJSDLFKJSDKLFJSD'
  });



});


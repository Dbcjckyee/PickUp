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
  navigator.geolocation.getCurrentPosition(success, failure)

  function success(position) {
      var coords = {
        latitude: position.coords.latitude,
        longitude: position.coords.longitude
      };
      $.ajax({
        data: coords,
        method: "POST",
        url: '/events/map',
      })


    }

  function failure(position){
    $('#nearevents').html("<H4>You must share your location to find nearby events</H4>")
  }

});


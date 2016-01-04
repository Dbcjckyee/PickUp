$(document).ready(function() {
  navigator.geolocation.getCurrentPosition(success, failure)
  function success(position) {
    var coords = {
      latitude: position.coords.latitude,
      longitude: position.coords.longitude
    };
    $.ajax({
      data: coords,
      method: "GET",
      url: '/events/map'
    })
    .done(function(page){
      $('#nearevents').append(page['partial'])
    })
  }
  function failure(position){
    $('#nearevents').html("<H4>You must share your location to find nearby events</H4>")
  }
});


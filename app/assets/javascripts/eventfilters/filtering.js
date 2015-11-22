$(document).ready(function(){
  $("#sport").change(function(){
    var state = {
      sport: $('select#sport :selected').val(),
      key: "sport"
    };
    $('select').val(0);
    $.ajax({
        data: state,
        method: "POST",
        url: '/allevents/update'
    })
  })

  $("#location").change(function(){
  navigator.geolocation.getCurrentPosition(success, failure)
  })

  success = function(position){
  var state = {
    location: $('select#location :selected').val(),
    key: "location",
    lat: position.coords.latitude,
    long: position.coords.longitude
  };
  console.log(state);
  $('select').val(0);
  $.ajax({
      data: state,
      method: "POST",
      url: '/allevents/update'
    })
  }

  failure = function(position){
    alert("You must share your position to find close events.")
  }



})

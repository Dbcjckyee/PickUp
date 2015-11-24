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
    success = function(position){
    var state = {
      location: $('select#location :selected').val(),
      key: "location",
      lat: position.coords.latitude,
      long: position.coords.longitude
    };
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
    navigator.geolocation.getCurrentPosition(success, failure)
  })

  $("#date").change(function(){
      var state = {
        date: $('select#date :selected').val(),
        key: "date"
      };
      $('select').val(0);
      $.ajax({
          data: state,
          method: "POST",
          url: '/allevents/update'
      })
    })

  $("#clear").click(function(event){
    event.preventDefault();
    $('select').val(0);
      $.ajax({
      data: {state: "neutral"},
      method: "POST",
      url: '/allevents/update'
    })
  })


})

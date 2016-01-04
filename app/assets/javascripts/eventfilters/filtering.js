$(document).ready(function(){
  ajaxCall = function(args){
    $.ajax({
      data: args,
      method: "GET",
      url: '/allevents/update'
    })
  }
  $("#sport").change(function(){
    var state = {
      sport: $('select#sport :selected').val(),
      key: "sport"
    };
    $('select').val(0);
    ajaxCall(state);
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
    ajaxCall(state);
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
          method: "GET",
          url: '/allevents/update'
      })
    })

  $("#clear").click(function(event){
    event.preventDefault();
    $('select').val(0);
    var state = {
      state: "neutral"
    }
     ajaxCall(state);
  })


})

$(document).ready(function(){
  ajaxCall = function(args){
    $('select').val(0);
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
    ajaxCall(state);
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

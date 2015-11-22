$(document).ready(function(){
  $("#sport").change(function(){
    var sportstate = {
      sport: $('select#sport :selected').val()
    };
    $('select').val(0);
    console.log(sportstate)
    $.ajax({
        data: sportstate,
        method: "POST",
        url: '/allevents/update'
    })
  })
})

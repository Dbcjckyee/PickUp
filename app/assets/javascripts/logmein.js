$(document).on('page:change', function(){
console.log("SWITCH")
  // $('#login').hide();
  $('.logmein').click(function(event){
    console.log("works")
    event.preventDefault();
    $('#login').toggle("slow");
  })

  $('#cancel').click(function(event){
      event.preventDefault();
    $('#login').toggle("slow");
  })
})

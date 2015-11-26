$(document).on('page:change', function(){
  // $('#login').hide();
  $('.logmein').click(function(event){
    event.preventDefault();
    $('#login').toggle("slow");
  })

  $('#cancel').click(function(event){
      event.preventDefault();
    $('#login').toggle("slow");
  })
})

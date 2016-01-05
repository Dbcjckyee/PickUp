$(document).on('page:change', function(){
  $('.logmein, #cancel').click(function(event){
    event.preventDefault();
    $('#login').toggle("slow");
  })
})

$(document).ready(function(){
  $('#login').removeClass("hidden").hide();
  $('.logmein').click(function(event){
    console.log("works")
    event.preventDefault();
    $('#login').slideDown("slow",function(){});
  })

})

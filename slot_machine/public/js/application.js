$(document).ready(function() {
  $("form").on("submit", function(event){
    event.preventDefault();
    $.post('/rolls', function(data){
      $("#die").html("")
      $("#die_ajax").html(data)
    });
  });
});

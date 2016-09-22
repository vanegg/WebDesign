$(document).ready(function() {

  $("form").on("submit", function(event) {
    event.preventDefault();
    data = $(this).serialize();
    console.log(this);
    console.log(data);
    $.post('/abuelita',data).done(function(data) {
      $("#grandma_ajax").html("Tu Abuelita dice:" + data);
    })
  });
});

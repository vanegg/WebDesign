$(document).ready(function() {

  $("form").on("submit", function(event) {
    event.preventDefault();
    data = $(this).serialize();
    $.post('/abuelita',data).done(function(data) {
      $("#grandma_says").empty();
      $("#grandma_says").append(data);
    })
  });
});

$(document).ready(function () {
  // Escribe tu código aquí
  $($(".active > a").attr('href')).show();
  $(".tabs > li > a").on("click", function(){
  $(".tabs > li").removeClass("active");
  $(this).parent().addClass("active");
  tab = $(this).attr('href');
  $(".tab").hide();
  $(tab).show();
  });
});


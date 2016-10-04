$(function() {
  length = '=100%';
  pos = 620;
  i = 0;

  $("#previous_frame").on("click", function(){
    // console.log("Previous frame");
    wl = parseInt($(".frames").css("margin-left"));
    // console.log(wl);
    if (wl == 0){
      // console.log("Nueva vuelta anterior")
      $(".frames").css("margin-left", "-300%")
    }
    $( ".frames" ).animate({
      marginLeft: '+' + length,
  }, 1500 );
  });

  $("#next_frame").on("click", function(){
    console.log(i++);
    console.log("Next frame");
    wl = parseInt($(".frames").css("margin-left"));
    // console.log(wl);
    if (wl == -1860){
      // console.log("Nueva vuelta")
      $(".frames").css("margin-left", "0px");
    }
    $( ".frames" ).animate({
      marginLeft: '-' + length,
  }, 1500 );
  });

});

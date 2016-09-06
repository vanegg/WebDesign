$(window).scroll(function() {
  // Aquí deberás escribir la lógica que modificará la barra
  // $("p").clone().appendTo( document.body );
  var lastScrollTop = 0;
  var st = $(this).scrollTop();

  if (st > lastScrollTop){
    $(".top-nav").css( "background-color", "rgba(1,1,1,0.7)" );
      } else {
    $(".top-nav").css( "background-color", "black" );
  }

  lastScrollTop = st;
});


// $(".tabs [href='#tab1']").click(function(){
//     $('#tab1').css('display','block');
//     $('#tab2').css('display','none');
//     $('#tab3').css('display','none');
//     $('li:nth-child(1)').addClass('active');
//     $('li:nth-child(2)').removeClass('active');
//     $('li:nth-child(3)').removeClass('active');
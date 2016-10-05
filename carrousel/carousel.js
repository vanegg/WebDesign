 $(function() {
  // almacenar slider en una variable
  var slider    = $('.frames');
  // almacenar los elementos dentro de .frames
  var liItems   = $('.frames li');
  //Saber el numero de elementos
  var imageNumber = liItems.length;

  //se ajusta al número de imagenes cambia width del ul para que se ajusten
  // slider.css("width", imageNumber * 100 +'%');
  //mover ultima imagen al pricipio de las imágenes
  //para posicionar en la que era la primer imagen
  // slider.css('margin-left', '-'+100+'%');
  $('.frames li:last').insertBefore('.frames li:first');



  $('#next_frame').click(function(){
    moverDerecha();
  });

  $('#previous_frame').click(function(){
    moverIzquierda();
  });

  function moverDerecha(){
    slider.animate(
      {marginLeft:'-'+200+'%'},
      700,
      function(){
          //la primer imagen pasa a ser la última
          $('.frames li:first').insertAfter('.frames li:last');
          //el margen vuelve a ser del -100%
          slider.css('margin-left', '-'+100+'%');
    });
  }
  
  function moverIzquierda(){
    slider.animate(
      {marginLeft:0},
      700,
      function(){
          //la última imagen pasa a ser la primera
          $('.frames li:last').insertBefore('.frames li:first');
          //el margen vuelve a ser del -100%
          slider.css('margin-left', '-'+100+'%');
    });
  }


});
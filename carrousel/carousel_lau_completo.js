 $(function() {
  // almacenar slider en una variable
  var slider    = $('.frames');
  // almacenar los elementos dentro de .frames
  var liItems   = $('.frames li');
  //Saber el numero de elementos
  var imageNumber = liItems.length;
  // almacenar botones en una variable
  var siguiente = $('#next_frame');
  var anterior  = $('#previous_frame');


  //se ajusta al número de imagenes cambia width del ul para que se ajusten
  slider.css("width", imageNumber * 100 +'%');
  //mover ultima imagen al pricipio de las imágenes
  $('.frames li:last').insertBefore('.frames li:first');
  //para posicionar en la que era la primer imagen
  slider.css('margin-left', '-'+100+'%');


  if(imageNumber == 0){
    $('.slider_controls').css("visibility", "hidden");
  }  else if(imageNumber == 1){
    //se ajusta al número de imagenes cambia width del ul para que se ajusten
    liItems.css("width", 100 / imageNumber+'%');
    slider.css('margin-left', 0+'%');
    siguiente.click(function(){
      alert("Solo has subido una imagen");
    });

    anterior.click(function(){
      alert("Solo has subido una imagen");
    });
    slider.css('margin', '0%');
  }
  else if(imageNumber == 2){
    //se ajusta al número de imagenes cambia width del ul para que se ajusten
    liItems.css("width", 100 / imageNumber+'%');
  }


 

  siguiente.click(function(){
    moverDerecha();
  });

  anterior.click(function(){
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
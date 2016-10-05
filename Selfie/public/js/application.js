$(document).ready(function() {

  //***************** VALIDATIONS *****************//
  var err1 = "Debe escribir una dirección de email válida";
  var err2 = "El password debe tener al menos un carácter numérico (0-9)";
  var err3 = "El password debe contener al menos una mayúscula";
  var err4 = "El password debe tener al menos 8 caracteres";
  var err5 = "El campo nombre no puede estar vacío";

  var reg_email = /^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/;

  $("#sign_up").on("click", function(event) {
    event.preventDefault();
    name = $("#name").val();
    email = $("#email").val();
    password = $("#password").val();
    var error = false;
    $(".fail").empty();

    if (email.match(reg_email) == null){
      $(".error").append("<li>" + err1 + "</li>");
      error = true;
    }

    if (password.match(/\d/) ==  null){
      $(".error").append("<li>" + err2 + "</li>");
      error = true;
    }

    if (password.match(/[A-Z]/) == null){
      $(".error").append("<li>" + err3 + "</li>");
      error = true;
    }

    if (password.length < 8){
      $(".error").append("<li>" + err4 + "</li>");
      error = true;
    }

    if (name == ""){
      $(".error").append("<li>" + err5 + "</li>");
      error = true;
    }
    
    if (!error){
      params = "name=" + name + "&email="+email+"&password="+ password;
      $.post('/users', params, function(url){ 
        window.location.href = url;     
      });      
    }
  });
  //*************** END VALIDATIONS ***************//

  url = '/user/'+ $("#user_id").text() + '/album/'

  $(".new_album").on("click",function(){
    console.log("Creating new album");
    $("#folders").append('<div class="folder"><a class="album" href="/"><img src="/folder.png" alt="Folder_<%=album.title%>" height="100" width="100"></a><div class="title_album"><input type="input" name="name_album" value="Title.."><input class="button add_newalbum" type="submit" value="Add"></div></div>');
  });

  $(".container").on("click", ".add_newalbum", add_album);

  function add_album(){
    $.post('/create_album',$("input"), function(id){
      $(".album").last().attr("href", url + id);
      $(".title_album").last().append('<div class="title_album">'+ $("input").val() +'</div>');
      $(".add_newalbum").remove();
      $(".title_album > input").remove();
    });
    
  }

  // *************** SORTABLE ************** //

  function sort_photos(){

  }

  $("#sortable").sortable();

  // *************** CAROUSEL ************** //
  var slider    = $('.frames');
  var liItems   = $('.frames li');
  var imageNumber = liItems.length;
  var siguiente = $('#next_frame');
  var anterior  = $('#previous_frame');

   slider.css("width", (imageNumber) * 100 +'%');
   console.log(slider.attr("width"));
  $('.frames li:last').insertBefore('.frames li:first');
  slider.css('margin-left', '-'+1+'%');

  if(imageNumber <= 1){
    $('.carousel_controls').css("visibility", "hidden");
    slider.css('margin', '0%');
  } else if(imageNumber == 2){
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

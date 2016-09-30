$(document).ready(function() {

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

});

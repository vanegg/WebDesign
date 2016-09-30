$(document).ready(function() {

  var err1 = "Debe escribir una dirección de email válida";
  var err2 = "El password debe tener al menos un carácter numérico (0-9";
  var err3 = "El password debe contener al menos una mayúscula";
  var err4 = "El password debe tener al menos 8 caracteres";
  var err5 = "Debe escribir un nombre";

  $("#sign_up").on("click", function(event) {
    event.preventDefault();
    name = $("#name").val();
    email = $("#email").val();
    password = $("#password").val();

    if (name == ""){
      $(".error").append("<li>" + err5 + "</li>")
    }
    
    console.log(name + email + password);
    console.log("Submit!");
  });

});

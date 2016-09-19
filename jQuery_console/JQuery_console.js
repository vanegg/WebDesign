 //Primeras líneas para hacer funcionar el JQuery en el browser
var script = document.createElement('script');
script.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(script);

//Encontrar Selectores utilizando el html reto.html
$('#QueHacemos > h2')
$('.pricing_features').find('li')
$('#QueHacemos > .feature > img')[0] //Primera imagen del div #QueHacemos

// Utiliza los selectores básicos ( element, id y class) 
// para seleccionar dos elementos de la pagina. 
// Utiliza la función .css() para alterar una propiedad de dos elementos distintos.
$('.pricing_features').css("color","red");
$('.pricing_features').css("background-color","blue");
$('#QueHacemos > .feature > img')[0].css("margin","20px");
$('#QueHacemos > .feature > img').css("width","500px");

// Utiliza los selectores básicos y el método .find() 
// para seleccionar una imagen en la página y cambiarla por otra imagen que te guste.

//Cambia la primera imagen por la ultima
$('#QueHacemos > .feature').find('img').first().attr("src", "https://codealab.files.wordpress.com/2015/06/image_2.jpg");


//Usa traverse methods para recorrer el DOM y 
// seleccionar todas las instancias de un elemento que se repita en la página y 
// utiliza el método animate() para modificarlos.

//Desaparece los li
$( "li" ).children().animate({
    opacity: 0.25,
    left: "+=50",
    height: "toggle"
  }, 5000, function() {
    // Animation complete.
  });

//Aumenta el tamaño de la letra de todos los tags 'p' en un tiempo de 1500
$( "p" ).animate({
    width: "70%",
    opacity: 0.4,
    marginLeft: "0.6in",
    fontSize: "3em",
    borderWidth: "10px"
  }, 1500 );

//Aumenta de tamaño las lista de la clase pricing_features
$( ".pricing_features").find('li').animate({
    opacity: 0.25,
    fontSize: "3em",
    borderWidth: "10px"
  }, 1500 );

// Busca un elemento al cual tengas que llegar utilizando al menos tres 
// selectors/traverse methods para localizarlo. Después utiliza el método .on() 
// para hacer un bind a un evento especifico que modifique el elemento.

//Al dar click en Twitter o @twitter_handle aparece un alert
//que indica el 'this'
$('#Contacto').find('table').find('tr:nth-child(2)').children().on("click", function() {
  alert( $( this ).text());
});
$(document).ready(function() {

  $("#start_btn").on("click", function(){
    restart();
    count();
   });

  function restart(){
    $("#result").text("");
    $("td").removeClass("active");
    $("td:nth-child(2)").addClass("active");
    $(".table tr").removeClass("winner");
}

$("#start_btn").on( "mouseenter mouseleave", function() {
    console.log( "mouse hovered over or left a div" );
});

function count(){
  $("#index").show();
  count_index = parseInt($("#index").text());
  if (!!count_index == false && count_index != 0){
  count_index = 4;
  }
   if (count_index == 0) {
    $("#index").text("¡Empieza!");
     move1();
     move2();
   } else {
    $("#index").text(count_index - 1);
    setTimeout(count,1000);
   }
}


function move1(){
  $("#start_btn").text("Reiniciar");
  finish1 = false;
  if ( parseInt($("#Player1 td.active").attr("id")) < 100) {
    next_td = $( "#Player1 td.active").next();
    $( "#Player1 td").removeClass("active");
    next_td.addClass("active");
    timeout1 = setTimeout(move1, 25);
   } else {
    finish1 = true;
   }
}

function move2(){
  finish2 = false;
  if ( parseInt($("#Player2 td.active").attr("id")) < 100) {
    next_td = $( "#Player2 td.active").next();
    $( "#Player2 td").removeClass("active");
    next_td.addClass("active");
    timeout2 = setTimeout(move2, 25);
   } else {
    finish2 = true;
   }
}

function result(){
  id_player1 = parseInt($("#Player1 td.active").attr("id"));
  id_player2 = parseInt($("#Player2 td.active").attr("id"));
  id_win = parseInt($("td.meta").attr("id"));
  dist_1 = Math.abs(id_player1 - id_win);
  dist_2 = Math.abs(id_player2 - id_win);

  if (id_player1 == id_player2 && id_player1 == 100){
    $("#result").text("¡Ambos jugadores perdieron!");
  } else if (dist_1 < dist_2){
    $("#result").text("Ganador: ¡Jugador 1!");
    $(".table tr").removeClass("winner");
    $("#Player1").addClass("winner");
  } else if (dist_1 > dist_2){
    $("#result").text("Ganador: ¡Jugador 2!");
    $(".table tr").removeClass("winner");
    $("#Player2").addClass("winner");
  } else {
    $("#result").text("¡Empate!");
  }
}

function finished_game(){
  console.log("ENTRO A FINISHED_GAME");
  console.log("finish1:" + finish1);
  console.log("finish2:" + finish2);
  if(finish1 && finish2){
    result();
  }
}

$(document).on('keyup', function(event) {
    if ( event.which == 65){
      clearTimeout(timeout1);
      finish1 = true;
      finished_game();
    }
    if ( event.which == 76 ){
     clearTimeout(timeout2);
     finish2 = true;
      finished_game();
    }
});

});
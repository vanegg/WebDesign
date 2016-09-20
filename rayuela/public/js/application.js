$(document).ready(function() {

  $("#start_btn").on("click", function(){
    count();
   });

function count(){
  count_index = parseInt($("#index").text());
   if (count_index == 0) {
     move();
   } else {
    $("#index").text(count_index - 1);
    setTimeout(count,1000);
   }
}

function move(){
  if ( parseInt($("td.active").attr("id")) < 100) {
    next_td = $("td.active").next();
    $("td").removeClass("active");
    next_td.addClass("active");
    setTimeout(move,50);
   } else {
    result();
   }
}

function result(){
  id_player1 = parseInt($("#Player1 td.active").attr("id"));
  id_player2 = parseInt($("#Player2 td.active").attr("id"));
  id_win = parseInt($("td.meta").attr("id"));
  dist_1 = abs(id_player1 - id_win)
  dist_2 = abs(id_player2 - id_win)
  if (id_player1 == id_player2 && id_player1 == 100){
    $("#result").text("Ambos jugadores perdieron")

     //AQUI ME QUEDEEEEEEEEEEE!!!!
  } else if (dist_1 < dist_2){

  }
}

$(document).on('keyup', function(event) {
    if ( event.which == 65){
    }
    if ( event.which == 76 ){
      alert( "JUGADOR 2" );
    }
});

});
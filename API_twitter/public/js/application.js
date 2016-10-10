$(document).ready(function() {

 $.get().always(function(){
  console.log("GETS")
  url = window.location.pathname;
  url_tweet = (url).indexOf("/user/");
  if(url_tweet >= 0){
    console.log($("#method").text());
     if ($("#method").text() == "DATABASE"){
    //se redirigio a la pagina de tweets  :D
    }
    else {
      console.log("Llendo a Peticion API Twitter");
      username = url.substring(url.indexOf("user/") + 4)

      $.post('/api' + username, function(partial){
         $(".spinner").css("display", "none");
         // console.log(partial);
         $('.tweets_area').append(partial);     

       });
    }
  }
 });

});

$(document).ready(function() {

  // $("#search").on("click", function(event){
  //   event.preventDefault();    
  //   //  $.post('/')
  //   //$(".spinner").css("display", "block");
  //  });


 $.get().always(function(data){
  url_tweet = (window.location.pathname).indexOf("/user/");
  if(url_tweet >= 0){
    //se redirigio a la pagina de tweets  :D
  console.log(window.location.pathname);
    
  }
 });

});

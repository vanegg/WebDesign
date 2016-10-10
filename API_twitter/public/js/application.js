$(document).ready(function() {

 $.get().always(function(){
  console.log("GETS")
  url = window.location.pathname;
  url_tweet = (url).indexOf("/user/");
  if(url_tweet >= 0){
    console.log($("#method").text());
    if ($("#method").text() != "DATABASE"){

      console.log("Llendo a Peticion API Twitter");
      username = url.substring(url.indexOf("user/") + 4)

      $.post('/api' + username, function(partial){
         $(".spinner").css("display", "none");
         $('.tweets_area').append(partial);    
      });
    }
  }
 });

 $("#tweetear").on("submit", function(event){
  event.preventDefault();
  $('#new_tweet_section').empty();
   tweet = $('input[name="tweet"]').val();
   $('#new_tweet_section').append('<img id="wait" src="/flickr.gif">');
   if (tweet.length >= 140){
   $('#new_tweet_section').empty();
    $('#new_tweet_section').append('<div class= "fail">Your tweet has more than 140 characters. Please try again.</div>');
   } else {
    t = {};
    t.tweet = tweet;
    $.post('/tweet',t, function(partial){
      $('#new_tweet_section').empty();      
      if (partial != "true"){
        $('#new_tweet_section').append(partial);   
      } else {
         $('#new_tweet_section').append('<div class= "fail">Something went wrong. Please try again.</div>');
      }
    });
   }


 });

});

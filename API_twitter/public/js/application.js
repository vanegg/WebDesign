$(document).ready(function() {

 $.get().always(function(){
  console.log("GETS")
  url = window.location.pathname;

  ///////////// SEARCH TWEETS OF AN USER
  url_tweet = (url).indexOf("/user/search/");
  if(url_tweet >= 0){
    console.log($("#method").text());
    if ($("#method").text() != "DATABASE"){

      console.log("Llendo a Peticion API Twitter");
      username = url.substring(url.indexOf("search/") + 6)

      $.post('/api' + username, function(partial){
         $(".spinner").css("display", "none");
         $('.tweets_area').append(partial);    
      });
    }
  }
  //////////// SEARCH TWEETS OF CURRENT USER
  url_tweet = (url).indexOf("/users/");
  if(url_tweet >= 0){

    console.log($("#method").text() + " users");
    if ($("#method").text() != "DATABASE"){
      $('.wait_spinner').append('<img id="wait" src="/flickr.gif">');
      console.log("Llendo a Peticion API Twitter");
      username = $("#current_user").text();
      $.post('/api/' + username, function(partial){
         $(".wait_spinner").css("display", "none");
         $('.tweets_area').append(partial);    
      });
    }
  }

 });

 $("#tweetear").on("submit", function(event){
    event.preventDefault();
    $('input[name="btn_tweet"]').prop('disabled', true);
    $('#new_tweet_section').empty();
    tweet = $('input[name="tweet"]').val();
    $('#new_tweet_section').append('<img id="wait" src="/flickr.gif">');
    if (tweet.length >= 140){
      $('input[name="btn_tweet"]').prop('disabled', false);
      $('#new_tweet_section').empty();
      $('#new_tweet_section').append('<div class= "fail">Your tweet has more than 140 characters. Please try again.</div>');
    } else {
      t = {};
      t.tweet = tweet;
      $.post('/tweet',t, function(partial){
        $('#new_tweet_section').empty();      
        if (partial != "true"){
          $('#new_tweet_section').append(partial);   
          $('input[name="btn_tweet"]').prop('disabled', false);
          $('input[name="tweet"]').val('');
        } else {
         $('#new_tweet_section').append('<div class= "fail">Something went wrong. Please try again.</div>');
         $('input[name="btn_tweet"]').prop('disabled', false);
        }
      });
    }
  });

});

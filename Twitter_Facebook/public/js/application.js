$(document).ready(function() {

 var jid = "";
 var pending_tweet = false;

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
      // $('.wait_spinner').append('');
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
      $('#new_tweet_section').empty().append('<div class= "fail">Your tweet has more than 140 characters. Please try again.</div>');
    } else {
      t = {};
      t.tweet = tweet;

      $.post('/tweet',t, function(partial){
        $('#new_tweet_section').empty();      
        if (partial != "fail"){
          $('#new_tweet_section').append(partial); 
          $('input[name="btn_tweet"]').prop('disabled', false);
          $('input[name="tweet"]').val('');
          section = $('#new_tweet_section');
          jid = ($(".jid").text());
          request_job(jid, section);

        } else {
         $('#new_tweet_section').append('<div class= "fail">Something went wrong. Please try again.</div>');
         $('input[name="btn_tweet"]').prop('disabled', false);
        }
      });

    }
  });

$('#btn_tweet_later').on('submit', function(event){
  event.preventDefault();
  tweet = $('input[name="text"]').val();
  time = $('input[name="time"]').val();
  section = $('#later_tweet_section');
  if (tweet.length >= 140){
      $('#later_tweet_section').empty().append('<div class= "fail">Your tweet has more than 140 characters. Please try again.</div>');
  } else {

    t = {};
    t.texto = tweet;
    t.tiempo = time;

    $.post('/later',t, function(jid){
      if (!!jid){        
        request_job(jid, section);
      }  else {
        $('#later_tweet_section').append('<div class= "fail">Something went wrong. Please try again.</div>');
      }  
    });    
  }
});

function request_job(job_id, section){
  path = '/status/' + job_id;
  $.post(path, function(status){
    console.log("Info de regreso:" + status);
    if (status == "true"){
      section.append('<p class="fail">Ya se subió a Twitter</p>');
      console.log("Your tweet is already sent");
    }else {
      console.log("Not yet");
      setTimeout(request_job, 1000, job_id, section);
    }
  });

}

  $(document).on('keyup', function(event) {
      if ( event.which == 27){
        $(".spinner").css("display", "none");
      }
  });

});

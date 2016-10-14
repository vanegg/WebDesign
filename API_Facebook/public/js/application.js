$(document).ready(function() {

 // following snippet of code will give the basic version of the SDK where the options are set to their most common defaults. You should insert it directly after the opening <body> tag on each page you want to load it:
 window.fbAsyncInit = function() {
    FB.init({
      appId      : '942106845916689',
      xfbml      : true,
      version    : 'v2.6',
      cookie     : true
    });
    console.log("FB init");
    FB.AppEvents.logPageView();


    ///////////////////// FUNCIONALIDAD

     $('.btn_login').click(function(event) {
          event.preventDefault();
          FB.login(function(response) {
            if (response.authResponse) {
              $('#results').empty().append('<p>Connecting...</p>');
              FB.getLoginStatus(function(response) {
                if (response.status === 'connected') {
                  $.get('/auth/facebook/callback', function(uid) {
                    console.log(uid);
                      if (uid != 'false'){
                        $('#results').empty().append('Connected! Callback complete.');
                        url = '/user/' + uid;
                          window.location.href = url;
                      }else {
                         $('#results').empty().append('Something went wrong. Please try again');
                      }
                  });
                }
              });
              
            }
          }); // if you want custom scopes, pass them as an extra, final argument to FB.login
        });

     $('.btn_logout').click(function(event){
      event.preventDefault();

      FB.getLoginStatus(function(response) {
            if (response.status === 'connected') {
                FB.logout(function(response){});
            }
            $.get('/log_out', function(){
              window.location.href = '/?';
            });
        });

     });
     $('.btn_post').click(function(event){ 
      var body = 'Reading JS SDK documentation from Facebook API';
      FB.api('/me/feed', 'post', { message: body }, function(response) {
        if (!response || response.error) {
          alert('Error occured' + response.error);
        } else {
          alert('Post ID: ' + response.id);
        }
      });
    });

    /////////////////////END FUNCIONALIDAD 


  };


  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

 

});


    // FB.getLoginStatus(function(response) {
    // if (response.status === 'connected') {

    //   console.log(response.authResponse.accessToken);

    //   $.post('/profile',response.status, function(partial){
    //     $(partial).appendTo(".profile");

    //   });

    // }
    // });


// IIFE
// (function(){

// })(x);

// (function(){

// }(x));


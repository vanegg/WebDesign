$(document).ready(function() {

   $(".btn_vote").on("submit", function(event){
     event.preventDefault();
     _this = $(this);
     id = $(this).serialize();
   $.post('/vote',id, function(votes){
     _this.siblings().find("#vote_"+ id.slice(-1)).text(votes);
    console.log(_this);
   });

  });
});

$(function(){

  new_form = '<form id="new_comment"><ul><div class="fail"></div></ul><textarea name="comment" rows="6" placeholder="Comentario"></textarea><input id="authorName" type="text" placeholder="Autor"><input type="submit" value="Enviar"></form>';

  // Agregar un nuevo comentario
  $("#new_comment_button").on("click",function(event){
    addComment();
  });

  $(".container").on("click","#new_comment_button", function(event){
    addComment();
  });

  $(".container").on("click", 'input[value="Enviar"]', function(){
    event.preventDefault();
    comment = $("#new_comment textarea").val();
    author = $("#authorName").val();
    valid = true;
    // Validaciones del comentario
    $(".fail").empty();
    if (comment == ""){      
      $(".fail").append("<li>Por favor ingresa un comentario</li>");
      valid = false;
    }
    if (author == ""){
      $(".fail").append("<li>Por favor ingresa un autor</li>");
      valid = false;
    } 
    if (valid){

      obj = {};
      obj.author = author;
      obj.comment = comment;

      $.post('/add',obj, function(success){
      // window.location.href = url + "";
      if (success == "true"){
        $("#comment_list").append('<li>' + comment + '<span class="author">' + author + '</span></li>');
        $("#comment_list").append('<button id="new_comment_button">Nuevo Comentario</button>');
        $("#new_comment").remove();
      }else {
        $(".fail").empty();
        $("#comment_list").append("<div class='fail'>Your comment was not added. Please try again</div>");
      }
      }); //Termina AJAX      
    }
  });

  function addComment() {
    event.preventDefault();
    $("#comment_area").append(new_form);
    $("#new_comment_button").remove();
  }

});


  

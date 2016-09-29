$(document).ready(function() {
  i = 0; //indice para las preguntas
  j = 0; //indice para las opciones
  $("#preview_question").append("<div class='new_question'><p><input type='text' id='q_name' size='20' name='q_name' value='' placeholder='Question'/><button id='btn_question' type='button'> Add Question</button></p></div>");
  $("#btn_complete").on("click", complete);
  $(".container").on("click", "#btn_add_option", add_option);
  $(".container").on("click", "#btn_done_question", done_question);
  $(".container").on("click", "#btn_question", box_question);

function complete(){
  json = createJSON(); 
  //AQUI VA UN AJAX CON TODA LA INFORMACIÓN
   $.post('/create_survey',json, function(url){
    window.location.href = url + "";
    });
}

function createJSON(){
  console.log("Creando JSON")
  num_o = 0;
  var b_question = '{"questions":[';
  $(".question").each( function(index){
    var question = $("#question" + index + " > h2").text();
    b_question += '{"question' + index + '": "' + question + '", "options": [';
    $("#option_area" + index + " > li").each (function(i_option){
      var option = $("#option" + num_o).text();
      b_question += '{"option' + num_o + '": "' + option + '"},';
      num_o ++;
    });
      b_question = b_question.substring(0, b_question.length - 1) + ']},';
  });
  console.log(b_question.substring(0, b_question.length - 1) + ']}');
  return JSON.parse(b_question.substring(0, b_question.length - 1) + ']}');
}

function box_question(){
  $("#survey_area").append("<div class='question' id='question" + i + "'><h2>"+ $('#q_name').val() + "</h2><ol><div class='option_area' id= 'option_area" + i +"''></div></ol><div class='section_option'><p><input id='o_name' type='text' size='20' name='o_name' value='' placeholder='Option'/> <button id='btn_add_option' type='button'> Add Option</button></p></div><button id='btn_done_question' type='button'> Done with question</button></div>");
  i++;
  $("#preview_question").remove();
  $(".new_question").remove();
  }

function add_option(){
  $("#option_area" + (i - 1)).append("<li id='option" + j + "'>" + $('#o_name').val() + "</li>");
  $("#o_name").val('');
  j++;
}

function done_question(){
  $(".section_option").remove();
  $("#survey_area").append("<div class='new_question'><p><input type='text' id='q_name' size='20' name='q_name' value='' placeholder='Question'/><button id='btn_question' type='button'> Add Question</button></p></div>");
  $(this).remove();
}

function question(){
  $("#survey_area").append("<div id='new_question'><p><input type='text' id='q_name' size='20' name='q_name' value='' placeholder='Question'/><button id='btn_add_question' type='button'> Add Question</button></p></div>");
}
});
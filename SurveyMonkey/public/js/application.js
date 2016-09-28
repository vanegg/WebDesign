$(document).ready(function() {
  i = 0; //indice para las preguntas
  j = 0; //indice para las opciones
  $("#btn_add_question").on("click", box_question);
  $("#btn_complete").on("click", complete);
  $(".container").on("click", "#btn_add_option", add_option(i));
  $(".container").on("click", "#btn_done_question", done_question);
  $(".container").on("click", "#btn_question", box_question);

function complete(){
  console.log("Boton complete apretado");
  //AQUI VA UN AJAX CON TODA LA INFORMACIÓN
}

function box_question(){
  $("#preview_question").hide();
  $("#new_question").hide();
  console.log("Boton add question apretado");
  console.log($('#q_name').val());
  $("#survey_area").append( "<div id='question" + i + "'><h2>"+ $('#q_name').val() + "</h2><ol><div id='option_area'></div></ol>");
  console.log(this.parent);
  option("#survey_area");
  $("#survey_area").append("<button id='btn_done_question' type='button'> Done with question</button></div>");
  i++;
  console.log("i:" + i)
  }

function option(selector){
  $(selector).append("<div class='section_option'><p><input id='o_name' type='text' size='20' name='o_name' value='' placeholder='Option'/> <button id='btn_add_option' type='button'> Add Option</button></p></div>");
}

function add_option(num){
  console.log("Boton add option apretado");
  $("#option_area").append("<li>" + $('#o_name').val() + "</li>");
  $("#o_name").val('');
}

function done_question(){
  console.log("Boton done with question apretado");
  $(".section_option").hide();
  $(this).hide();
  $("#survey_area").append("<div id='new_question'><p><input type='text' id='q_name' size='20' name='q_name' value='' placeholder='Question'/><button id='btn_question' type='button'> Add Question</button></p></div>");
  console.log("Ready")
}

function question(){
  $("#survey_area").append("<div id='new_question'><p><input type='text' id='q_name' size='20' name='q_name' value='' placeholder='Question'/><button id='btn_add_question' type='button'> Add Question</button></p></div>");
}

});
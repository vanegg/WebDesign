require 'json'

post '/survey' do
  puts "IN POST /survey"
  survey = Survey.new(name: params[:survey_name])
  current_user.surveys << survey
  if survey.save
    redirect to "/survey/#{survey.id}/create"
  else
    @falla = true
    erb :profile
  end
end

get '/survey/:id/create' do
  @survey = Survey.find(params[:id])
  erb :create_survey
end

post '/create_survey' do
  num_op = 0
  survey = params
  questions = survey["questions"]
  questions.each_with_index do |item, index|
    key_q = "question" + index.to_s
    question = Question.create(text: item[1][key_q])
    options = item[1]["options"]
    options.each do |item_op|
      key_op = "option" + num_op.to_s
      option = Option.create(text: item_op[1][key_op])
      question.options << option
      num_op += 1
    end
    current_user.surveys.last.questions << question
  end
  "/users/#{current_user.id}"
end

get '/survey/answer/:id' do
  @survey = Survey.find(params[:id])
  erb :answer_survey
end

post '/responses' do 
  a_params = params.to_a
  a_params.shift
  survey = Survey.find(params[:survey_id])
  a_params.each do |key, value|
    response = Response.new();
    current_user.responses << response
    survey.responses << response
    new_key = key.to_s
    new_key = new_key.gsub("response_","")
    question = Question.find(new_key.to_i)
    question.responses << response
    option = Option.find(value)
    response.option_id = value
    response.save
  end
  redirect to "/users/#{current_user.id}"
end

get '/survey/results/:id' do
  @survey = Survey.find(params[:id])
  erb :result_survey
end
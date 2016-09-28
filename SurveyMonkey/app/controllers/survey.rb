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
  survey = params
  p questions = survey["questions"]
  questions.each_with_index do |item, index|
    name = "question" + index.to_s
    question = Question.create(text: item[1][name])
    current_user.surveys.last.questions << question
    options = item[1]
  end

  # question =  Question.create(text: qs["0"][name])
"true"
end
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
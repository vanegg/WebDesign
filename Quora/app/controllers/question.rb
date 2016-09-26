
get '/info' do
  erb :update_info
end

post '/vote' do
  vote = Vote.create()
  current_user.votes << vote
  if params[:question_id].nil?
    answer_id = params[:answer_id]
    answer = Answer.find(answer_id)
    answer.votes << vote
    answer.save
  else
    question_id = params[:question_id]
    question = Question.find(question_id)
    question.votes << vote
    question.save
  end
  current_user.save
  @questions = Question.all
  erb :profile
end

get '/question/new' do
  erb :create_question
end

post '/questions' do
  @falla = false
  question = Question.new(text: params[:text])
  if question.save
    current_user.questions << question
    redirect "/users/#{current_user.id}"
  else
    @falla = true
    redirect '/question/new'
  end
end

post '/question/search' do
  puts "IN /question/search"
  @questions = Question.where(id: params[:id])
  if @questions.length < 1
    @falla = true
    @answers = false
  end
  @answers = true
  erb :profile
end

post '/question/answers/' do
  puts "IN POST /question/answers"
  redirect to "/question/#{params[:question_id]}/answers"
end

get '/question/:question_id/answers' do
  puts "IN GET /question/:question_id/answers"
  @answers = true
  @answer_create = false
  @answer_see = true
  @questions =  Question.where(id: params[:question_id])  
  erb :profile
end

post '/question/answers/new' do
  puts "IN POST /question/answers/new"
  redirect to "/question/#{params[:question_id]}/answers/new"
end

get '/question/:question_id/answers/new' do
  puts "IN GET /question/:question_id/answers/new"
  @answers = true
  @answer_create = true
  @answer_see = true
  @questions =  Question.where(id: params[:question_id])  
  erb :profile
end

post '/answers' do 
  answer = Answer.new(text: params[:text])
  if answer.save
    current_user.answers << answer
    question = Question.find(params[:question_id])
    question.answers << answer
  else
    @falla = true
  end
  @answers = true
  @questions = Question.where(user_id: current_user.id)
  erb :profile
end
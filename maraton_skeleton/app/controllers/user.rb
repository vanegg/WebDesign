get '/' do
  @notlog = params[:notlog]
  erb :index
end

get '/signup' do
  erb :sign_up
end

get '/login' do
  erb :login
end

before '/users/:id' do
 if session[:id] == nil
    notlog = true
    redirect to ("/?notlog=#{notlog}")
  end
end

get '/users/:id' do
    @user = User.find(params[:id])
    @deck = Deck.all
    erb :profile
end

post '/signup' do
  user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if user.save
    @falla = false
  redirect to ("/")
  else
    @falla = true
    erb :sign_up
  end
end

post '/login' do
  user = User.authenticate(params[:email],params[:password])
   if user != nil
     session[:id] = user.id
     redirect to ("/users/#{user.id}")
   else
    @falla = true
    erb :login
   end
end

post '/logout' do
  session.clear
  erb :index
end

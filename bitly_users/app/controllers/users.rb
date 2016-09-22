
before '/users/:id' do
 if session[:id] == nil
    notlog = true
    redirect to ("/?notlog=#{notlog}")
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
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

get '/signup' do
  erb :sign_up
end
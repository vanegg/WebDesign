get '/login' do
  erb :login
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


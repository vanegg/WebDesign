before '/users/:id' do
 if session[:id] == nil
    notlog = true
    redirect to ("/?notlog=#{notlog}")
  end
end

get '/users/:id' do
  if User.exists?(id: params[:id])
    @user = User.find(params[:id])
    erb :profile
  end
end

get '/sign' do
  puts "DENTRO DEL SIGN"
  erb :sign_up
end
post '/signup' do
  @user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if @user.save
    @falla = false
    redirect to ("/users/#{@user.id}")
  else
    @falla = true
    erb :sign_up
  end
end
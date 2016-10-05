get '/' do
  if session[:id] == nil
    session.clear
    @notlog = params[:notlog]
    erb :index
  else
    redirect to ("/users/#{session.id}")
  end
end

# C R U D

# /********** CREATE USER **********/

get '/user/new' do
  erb :create_user
end

post '/users' do
  p params
  user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if user.save
    @falla = false
  url = "/"
  else
    @falla = true
    url = "/user/new"
  end
end

# /******** END-CREATE USER ********/

# /********** READ USER **********/

get '/login' do
  erb :read_user
end

post '/user/login' do
  puts "IN POST /users/login"
  user = User.authenticate(params[:email],params[:password])
  puts " SESSION ID ANTES #{session[:id]}"
   if user != nil
     session[:id] = user.id
     redirect to ("/users/#{user.id}")
   else
    @falla = true
    erb :read_user
   end
end

before '/users/:id' do
  puts "IN BEFORE /users/:id"
 if session[:id] == nil
    notlog = true
    redirect to ("/?notlog=#{notlog}")
  end
end
 
get '/users/:id' do
  puts "IN GET /users/:id"
  @user = current_user
  @photos = Photo.all
  erb :profile
end
# /******** END-READ USER ********/

# /********** UPDATE USER **********/

get '/update' do
  puts "IN GET /update"
  puts "SESSION ID: #{session[:id]}"
  if logged_in?
    erb :update_user
  else
    notlog = true
    redirect to ("/?notlog=#{notlog}")
  end
end

post '/user/update' do
  puts "SESSION ID: #{session[:id]}"
 user = User.authenticate(current_user.email,params[:password])

  if user
    user.name = params[:name] if params[:name] != ""
    user.email = params[:email] if params[:email] != ""
    user.password = params[:password_new] if params[:password_new] != ""
    if user.save 
      redirect to ("/users/#{user.id}")      
    else
      redirect to ('/update?falla=true')
    end
  else
    @falla = true
    erb :update_user
  end
end
# /******** END-UPDATE USER ********/

# /********** DELETE USER **********/
get '/delete' do
  puts "IN GET /delete"
  if logged_in?
    erb :delete_user
  else
    notlog = true
    redirect to ("/?notlog=#{notlog}")
  end
end

post '/user/delete' do
  user = User.authenticate(current_user.email,params[:password])
  if user
    if User.delete(user.id)
      session.clear
      redirect to ("/")      
    else
      redirect to ('/delete?falla=true')
    end
  else
    @falla = true
    erb :delete_user
  end
end
# /******** END-DELETE USER ********/
get '/logout' do
  session.clear
  erb :index
end
get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get '/auth/:provider/callback' do
  auth_hash = request.env["omniauth.auth"]
  user = User.from_omniauth(auth_hash)
  session[:user_id] = user.id
  user ? user.uid : "false"
end

get '/user/:uid' do
  @user = User.find_by(uid: params[:uid])
  p fb = @user.facebook
  p @me = @user.me
  # p @friends = fb.get_connections("me", "friends")
  # p @feed = fb.get_connections("me", "feed")
  # fb.put_wall_post('Post utilizando Koala GEM Facebook API! :D')

  erb :_profile
  # Muestra en tu perfil tu imagen, la lista de tus amigos, y tu feed. INVESTIGA cómo hacer éstas peticiones al API.

end

get '/log_out' do
  session.clear
end

post '/profile' do
  "<p>Conectado</p>"
end

# post '/me/feed' do

# end
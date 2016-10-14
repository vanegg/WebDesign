get '/sign_in' do
  session.delete(:request_token)
  # El método `request_token` es uno de los helpers
  # Esto lleva al usuario a una página de twitter donde sera atentificado con sus credenciales
  redirect request_token.authorize_url(:oauth_callback => "http://#{host_and_port}/auth")
  # Cuando el usuario otorga sus credenciales es redirigido a la callback_url 
  # Dentro de params twitter regresa un 'request_token' llamado 'oauth_verifier'
end

get '/auth' do
  # Volvemos a mandar a twitter el 'request_token' a cambio de un 'acces_token' 
  # Este 'acces_token' lo utilizaremos para futuras comunicaciones.   
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # Despues de utilizar el 'request token' ya podemos borrarlo, porque no vuelve a servir. 
  session.delete(:request_token)
  p @access_token

  # Aquí es donde deberás crear la cuenta del usuario y guardar usando el 'acces_token' lo siguiente:
  # nombre, oauth_token y oauth_token_secret
  # No olvides crear su sesión 
  name        = @access_token.params[:screen_name]
  oauth_token = @access_token.params[:oauth_token]
  oauth_token_secret = @access_token.params[:oauth_token_secret]
  
  if Twitteruser.exists?(name: name)
    user = Twitteruser.find_by(name: name)
    user.oauth_token = oauth_token
    user.oauth_token_secret = oauth_token_secret
    user.save
  else
    user = Twitteruser.create(name: name, oauth_token: oauth_token, oauth_token_secret: oauth_token_secret)
  end
  session[:user_id] = user.id
  redirect to ("/users/#{user.name}")
end

post '/tweet' do
  p "/TWEET"
  tweet = params[:tweet]
  if tweet.length <= 140
    @jid = current_user.tweet_later(tweet)
    @tweet = Tweet.last == Tweet.find_by(text: tweet) ? Tweet.last : Tweet.find_by(text: tweet)
    erb :_new_tweet, layout: false
  else
    "fail"
  end
end

post '/later' do 
  text = params[:texto]
  time = params[:tiempo]
  if text.length <= 140
    jid = current_user.tweet_later(text, time.to_i)
  else
    nil
  end
end

post '/status/:job_id' do
  # regresa el status de un job a una petición AJAX
  p "+" * 50
  job_is_complete(params[:job_id]).to_s
end
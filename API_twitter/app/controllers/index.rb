# https://github.com/sferik/twitter
get '/' do
  @fail = params[:fail]
  @username = params[:username]
  erb :index
end

post '/tweet' do
  p "/TWEET"
  tweet = params[:tweet]
  if tweet.length <= 140
    @tweet = twitter_user.update(tweet)
    erb :_new_tweet, layout: false
  else
    "true"
  end
end

post '/fetch' do
  p "/FETCH"
  # Se crea un TwitterUser si no existe en la base de datos de lo contrario trae de la base al usuario. 
  redirect to ("/user/search/#{params[:user]}")
end

get '/user/search/:username' do
  unless Twitteruser.exists?(name: params[:username])
    user = Twitteruser.create(name: params[:username]) 
  else
    user = Twitteruser.find_by(name: params[:username])
  end
  #Método que regresa true si los tweets estan desactualizados
  if outdated_tweets?(user)
    @wait = true
    @method = "PETICION TWITTER"
  else
    @wait = false
    @method = "DATABASE"
    @tweets = user.tweets 
  end
    p "Redirigiendo"
    @name = params[:username]
    erb :read_tweets  
end

post '/api/:username' do
  user = Twitteruser.find_by(name: params[:username])
    # Tweets desactualizados
  handle = twitter_user.user_timeline(params[:username])
    if user.tweets.length == 0
      handle.each do |tweet|
        t = Tweet.create(text: tweet.text, date: tweet.created_at)
        user.tweets << t
      end
    else
      handle.each do |tweet|
        existed_tweet = Tweet.exists?(text: tweet.text, date: tweet.created_at)
        unless existed_tweet
          t = Tweet.create(text: tweet.text, date: tweet.created_at)
          user.tweets << t
        end
      end
    end
    @tweets = user.tweets
    erb :_tweets, layout: false
end

def outdated_tweets?(user)
  if user.tweets.length == 0
    true
  else
    segs = (Time.now.utc - user.tweets.order(date: :desc).first.created_at).to_i
    segs <= 3600 ? false : true
  end
end

# NAME=TwitterAPIVanessa
# DESCRIPTION=First try using Twitter API
# WEBSITE=http://vangg.mx/tweet_api_web
# CALLBACK URL=http://localhost/:9393/inside_of_twitter

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

get '/users/:username' do
   unless Twitteruser.exists?(name: params[:username])
    user = Twitteruser.create(name: params[:username]) 
  else
    user = Twitteruser.find_by(name: params[:username])
  end
  #Método que regresa true si los tweets estan desactualizados
  if outdated_tweets?(user)
    @wait = true
    @method = "PETICION TWITTER"
  else
    @wait = false
    @method = "DATABASE"
    @tweets = user.tweets 
  end
  erb :profile
end

  # Para el signout no olvides borrar el hash de session
get "/sign_out" do
  session.clear
  redirect to ('/')
end

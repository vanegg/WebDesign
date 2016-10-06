# https://github.com/sferik/twitter
get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

post '/fetch' do
  p "/FETCH"
  redirect to ("/user/#{params[:user]}")
end

post '/tweet' do
  p "/TWEET"
  tweet = params[:tweet]
  p tweet.length
  if tweet.length <= 140
    @fail = false
    CLIENT.update(tweet)
  else
    @fail = true
    erb :index
  end
  redirect to ("/user/#{params[:user]}")
end

get '/get/:handle' do
  p "/HANDLE"
  @name = CLIENT.user(params[:handle]).screen_name
  @handle = CLIENT.user_timeline(params[:handle])
  erb :read_tweets
end

get '/user/:username' do
  # Se crea un TwitterUser si no existe en la base de datos de lo contrario trae de la base al usuario. 
  if Twitteruser.exists?(name: params[:username])
    user = Twitteruser.find_by(name: params[:username])
  else
    user = Twitteruser.create(name: params[:username]) 
  end
  p user
  #Método que regresa true si los tweets estan desactualizados 
  if user.tweets.length == 0
    # Pide a Twitter los últimos tweets del usuario y los guarda en la base de datos
    @handle = CLIENT.user_timeline(params[:username])
    @handle.each do |tweet|
      t = Tweet.create(text: tweet.text)
    end
  end

  # Se hace una petición por los ultimos 10 tweets a la base de datos. 
  @tweets =
  @name = CLIENT.user(params[:handle]).screen_name
  erb :read_tweets
end

# NAME=TwitterAPIVanessa
# DESCRIPTION=First try using Twitter API
# WEBSITE=http://vangg.mx/tweet_api_web
# CALLBACK URL=http://vangg.mx/inside_of_twitter


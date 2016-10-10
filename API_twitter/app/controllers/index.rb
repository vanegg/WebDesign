# https://github.com/sferik/twitter
get '/' do
  erb :index
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
  redirect to ("/")
end

post '/fetch' do
  p "/FETCH"
  # Se crea un TwitterUser si no existe en la base de datos de lo contrario trae de la base al usuario. 
  redirect to ("/user/#{params[:user]}")
end

# get '/get/:handle' do
#   p "/HANDLE"
#   @name = CLIENT.user(params[:handle]).screen_name
#   @handle = CLIENT.user_timeline(params[:handle])
#   erb :read_tweets
# end

get '/user/:username' do
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
    p "Entrando a database"
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
  handle = CLIENT.user_timeline(params[:username])
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
    "lalala"
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
# CALLBACK URL=http://vangg.mx/inside_of_twitter


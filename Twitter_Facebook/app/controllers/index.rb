# https://github.com/sferik/twitter
get '/' do
  @fail = params[:fail]
  @username = params[:username]
  if logged_in?
    redirect to ("/users/#{current_user.name}")
  else
    erb :index
  end
end

post '/fetch' do
  p "/FETCH"
  redirect to ("/user/search/#{params[:user]}")
end

get '/user/search/:username' do
  search_tweets(params[:username])
  p "Redirigiendo"
  @name = params[:username]
  erb :read_tweets  
end

get '/users/:username' do
  search_tweets(params[:username])
  if params[:jid]
    @jid = params[:jid]
  end
  erb :profile
end

def search_tweets(username)
  unless Twitteruser.exists?(name: username)
    user = Twitteruser.create(name: username) 
  else
    user = Twitteruser.find_by(name: username)
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
end

post '/api/:username' do
    user = Twitteruser.find_by(name: params[:username])
      # Tweets desactualizados
    handle = current_user.twitter_user.user_timeline(params[:username])
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

  # Para el signout no olvides borrar el hash de session
get "/sign_out" do
  session.clear
  redirect to ('/')
end
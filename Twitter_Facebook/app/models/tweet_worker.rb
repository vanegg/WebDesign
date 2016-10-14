# http://railscasts.com/episodes/366-sidekiq?language=es&view=asciicast
class TweetWorker
  include Sidekiq::Worker

  sidekiq_options :retry => 5 #Only five retries and then to the Dead Job Queue
  # sidekiq_options :retry => false # job will be discarded immediately if failed
  
  def perform(tweet_id)
    if Tweet.exists?(tweet_id)
      tweet = Tweet.find(tweet_id)
      user = Twitteruser.find(tweet.twitteruser_id)
      # Manda a llamar el método del usuario que crea un tweet (user.tweet)
      user.tweet(tweet.id)
    end    
  end
end
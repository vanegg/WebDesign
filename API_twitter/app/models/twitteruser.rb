class Twitteruser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def tweet(id)
    tweet = Tweet.find(id)
    tweet.date = Time.now.utc
    tweet.save
    self.twitter_user.update(tweet.text)
  end

  def tweet_later(text, time = 0)
    # tweet = # Crea un tweet relacionado con este usuario en la tabla de tweets
    # Este es un método de Sidekiq con el cual se agrega a la cola una tarea para ser
    tweet = Tweet.create(text: text)
    user = Twitteruser.find(self.id)
    #user = current_user   
    user.tweets << tweet

    # MANERA SINCRONA
    TweetWorker.perform_in(time, tweet.id)

    # MANERA ASINCRONA
    # TweetWorker.perform_async(tweet.id)

    #La última linea debe de regresar un sidekiq job id
  end

  def twitter_user
  # CLIENT = 
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = self.oauth_token
      config.access_token_secret = self.oauth_token_secret
    end
  end

end
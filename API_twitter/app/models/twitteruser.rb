class Twitteruser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets
end

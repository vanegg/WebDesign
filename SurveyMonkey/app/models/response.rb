class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :option
  belongs_to :question
  belongs_to :user
  belongs_to :survey
end

class Question < ActiveRecord::Base
  # Remember to create a migration!

  has_many :answers
  has_many :votes
  belongs_to :user
  
  validates :text, presence: true
end

class Player < ActiveRecord::Base

  validates :name, uniqueness: true

  # has_and_belongs_to_many :games
  #OR
  has_many :player_games
  has_many :games, through: :player_games
end

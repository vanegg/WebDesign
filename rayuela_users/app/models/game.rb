class Game < ActiveRecord::Base
  # Remember to create a migration!
  # has_and_belongs_to_many :players
  #OR
  has_many :player_games
  has_many :players, through: :player_games

  validate :two_players

  def two_players
    if (self.players.length > 2)
      errors.add(:players, "there are two players already")
    end
  end

  def name_validate
    if (name == "HOLA")
      errors.add(:name, "is not a name")
    end
  end


end

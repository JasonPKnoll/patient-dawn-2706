class Team < ApplicationRecord
  has_many :players
  belongs_to :competition

  def self.average_age_of_players
    select(:nickname, "avg(players.age) as average").joins(:players).group(:nickname).order("average desc")
  end
end

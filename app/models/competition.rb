class Competition < ApplicationRecord
  has_many :teams

  def average_age_of_players
    teams.joins(:players).average(:age).to_f.round(2)
  end

end

require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:teams) }
  end

  describe 'instance methods' do
    before(:each) do
      @comp_1 = Competition.create!(name: "Ironman Triathlon", location: "New York", sport: "running")

      @az = @comp_1.teams.create!(hometown: "Phoenix", nickname: "AZ")
      @ny = @comp_1.teams.create!(hometown: "New York", nickname: "NY")
      @tx = @comp_1.teams.create!(hometown: "Dallas", nickname: "TX")

      @plager_1_az = @az.players.create!(name: "Sarah", age: 21)
      @plager_2_az = @az.players.create!(name: "Jim", age: 25)

      @plager_3_ny = @az.players.create!(name: "Mike", age: 32)
      @plager_4_ny = @az.players.create!(name: "Jenny", age: 30)

      @plager_3_tx = @az.players.create!(name: "Jared", age: 2)
      @plager_4_tx = @az.players.create!(name: "Nichole", age: 18)
    end

    it "can find average of all players" do
      expect(@comp_1.average_age_of_players).to eq(21.33)
    end

  end
end

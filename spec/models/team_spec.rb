require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should belong_to(:competition) }
  end

  describe "class methods" do
    before(:each) do
      @comp_1 = Competition.create!(name: "Ironman Triathlon")

      @az = @comp_1.teams.create!(hometown: "Phoenix", nickname: "AZ")
      @ny = @comp_1.teams.create!(hometown: "New York", nickname: "NY")
      @tx = @comp_1.teams.create!(hometown: "Dallas", nickname: "TX")

      @plager_1_az = @az.players.create!(name: "Sarah", age: 21)
      @plager_2_az = @az.players.create!(name: "Jim", age: 25)

      @plager_3_ny = @ny.players.create!(name: "Mike", age: 32)
      @plager_4_ny = @ny.players.create!(name: "Jenny", age: 30)

      @plager_3_tx = @tx.players.create!(name: "Jared", age: 2)
      @plager_4_tx = @tx.players.create!(name: "Nichole", age: 18)
    end

    it "calculates average ages of players" do
      expect(Team.average_age_of_players[0].average.to_f.round(2)).to eq(31.0)
      expect(Team.average_age_of_players[1].average.to_f.round(2)).to eq(23.0)
      expect(Team.average_age_of_players[2].average.to_f.round(2)).to eq(10.0)
    end
  end
end

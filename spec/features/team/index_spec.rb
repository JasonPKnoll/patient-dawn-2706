require 'rails_helper'

RSpec.describe Competition do
  describe "competition index" do
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

      visit "/competitions/#{@comp_1.id}/teams/"
    end

    it "can visit page" do
      visit "/competitions/#{@comp_1.id}/teams/"
      expect(page).to have_content("All Teams for #{@comp_1.name}")
    end

    it "have all teams nicknames" do
      expect(page).to have_content("#{@az.nickname}")
      expect(page).to have_content("#{@ny.nickname}")
      expect(page).to have_content("#{@tx.nickname}")
    end

    it "has all teams average age of its players" do
      expect(page).to have_content(2)
      expect(page).to have_content(2)
      expect(page).to have_content(2)
    end

    it "has teams sorted by the average players age"
  end
end

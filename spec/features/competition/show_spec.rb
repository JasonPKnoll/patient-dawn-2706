require 'rails_helper'

RSpec.describe Competition do
  describe "competition index" do
    before(:each) do
      @comp_1 = Competition.create!(name: "Ironman Triathlon", location: "New York", sport: "running")

      @az = @comp_1.teams.create!(hometown: "Phoenix", nickname: "AZ")
      @ny = @comp_1.teams.create!(hometown: "New York", nickname: "NY")
      @tx = @comp_1.teams.create!(hometown: "Dallas", nickname: "TX")

      @plager_1_az = @az.players.create!(name: "Sarah", age: 21)
      @plager_2_az = @az.players.create!(name: "Jim", age: 25)

      @plager_3_ny = @ny.players.create!(name: "Mike", age: 32)
      @plager_4_ny = @ny.players.create!(name: "Jenny", age: 30)

      @plager_3_tx = @tx.players.create!(name: "Jared", age: 2)
      @plager_4_tx = @tx.players.create!(name: "Nichole", age: 18)

      visit "/competitions/#{@comp_1.id}"
    end

    it "can visit page" do
      visit "/competitions/#{@comp_1.id}"
      expect(page).to have_content("#{@comp_1.name}")
    end

    it "shows all attributes" do
      expect(page).to have_content("#{@comp_1.name}")
      expect(page).to have_content("#{@comp_1.location}")
      expect(page).to have_content("#{@comp_1.sport}")
    end

    it "has teams" do
      expect(page).to have_content("#{@az.nickname}")
      expect(page).to have_content("#{@az.hometown}")

      expect(page).to have_content("#{@ny.nickname}")
      expect(page).to have_content("#{@ny.hometown}")

      expect(page).to have_content("#{@tx.nickname}")
      expect(page).to have_content("#{@tx.hometown}")
    end

    it "shows the average age of all players" do
      expect(page).to have_content(21.33)
    end

    it "has link to register a new team" do
      click_link "Register New Team"
    end

    it "can create new team" do
      click_link "Register New Team"

      expect(current_path).to eq("/competitions/#{@comp_1.id}/teams/new")

      fill_in "nickname", with: "CA"
      fill_in "hometown", with: "Sacramento"

      click_button "Submit"

      expect(current_path).to eq("/competitions/#{@comp_1.id}")
      expect(page).to have_content(@comp_1.teams.last.nickname)
      expect(page).to have_content(@comp_1.teams.last.hometown)
    end
  end
end

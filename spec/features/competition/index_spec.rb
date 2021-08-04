require 'rails_helper'

RSpec.describe Competition do
  describe "competition index" do
    before(:each) do
      @comp_1 = Competition.create!(name: "Ironman Triathlon")
      @comp_2 = Competition.create!(name: "Tour De France")
      @comp_3 = Competition.create!(name: "Aquatic World Championships")
      visit "/competitions/"
    end

    it "can visit page" do
      visit "/competitions/"
      expect(page).to have_content("All Competitions")
    end

    it "shows the name of all competitions" do
      expect(page).to have_content("Ironman Triathlon")
      expect(page).to have_content("Tour De France")
      expect(page).to have_content("Aquatic World Championships")
    end

    it "has links to that competitions show page" do
      click_link "Ironman Triathlon"

      expect(current_path).to eq("/competitions/#{@comp_1.id}")
    end
  end
end

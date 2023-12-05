require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
  describe 'As a visitor, when I visit the welcome page' do
    before :each do
      visit root_path
    end

    it 'I see a welcome message' do
      expect(page).to have_content("Welcome to GitFit")
    end

    it 'has a link to create a new movement' do
      expect(page).to have_link("Record a Movement")
    end

    it 'when I click the link to record a movement, I am taken to a new movemnet page' do
      click_link("Record a Movement")

      expect(current_path).to eq(new_movement_path)
    end

    it 'has a link to view all movements' do
      expect(page).to have_link("View All Movements")
    end

    it 'when I click the link to view all movements, I am taken to the movemnets index page' do
      click_link("View All Movements")

      expect(current_path).to eq(movements_path)
    end
  end
end
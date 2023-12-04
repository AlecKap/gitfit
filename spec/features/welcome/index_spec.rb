require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
  describe 'As a visitor' do
    it 'I see a welcome message' do
      visit root_path

      expect(page).to have_content("Welcome to GitFit")
    end
  end
end
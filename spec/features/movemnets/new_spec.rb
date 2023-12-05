require 'rails_helper'

RSpec.describe 'new movement page' do
  describe 'As a visitor, when I visit the new movement page' do
    before :each do
      visit new_movement_path
    end

    it 'I see a form to record a new movement' do
      expect(page).to have_field("Name of mover")
      expect(page).to have_field("Type of movement")
      expect(page).to have_field("Reps")
      expect(page).to have_field("Weight")
      expect(page).to have_button("Record Movement")
    end

    # happy path
    it 'when I fill in all fields of the form and click the button, I am taken to the movements index page 
      and I see a flash message stating that my movement has been successfully recorded' do
      fill_in "Name of mover", with: "John Doe"
      fill_in "Type of movement", with: "curls"
      fill_in "Reps", with: 10
      fill_in "Weight", with: 20

      click_button("Record Movement")
      
      expect(current_path).to eq(movements_path)
      expect(page).to have_content("Movement successfully recorded!")
    end

    it 'when I fill in all fields of the form except for the weight field and click the button, I am taken to the movements index page 
      and I see a flash message stating that my movement has been successfully recorded' do
      fill_in "Name of mover", with: "John Doe"
      fill_in "Type of movement", with: "curls"
      fill_in "Reps", with: 10
      fill_in "Weight", with: ""

      click_button("Record Movement")
      
      expect(current_path).to eq(movements_path)
      expect(page).to have_content("Movement successfully recorded!")
    end

    # sad path
    it 'when I fill in the form but leave name of mover field blank 
      and click the button, I stay on the new movement page and see a flash message
      telling me to fill in all required fields' do
      fill_in "Name of mover", with: ""
      fill_in "Type of movement", with: "curls"
      fill_in "Reps", with: 10
      fill_in "Weight", with: 25

      click_button("Record Movement")
      
      expect(current_path).to eq(new_movement_path)
      expect(page).to have_content("Please fill in all required fields. You may leave Weight field blank if using just body weight.")
    end
    
    it 'when I fill in the form but leave type of movement field blank 
      and click the button, I stay on the new movement page and see a flash message
      telling me to fill in all required fields' do
      fill_in "Name of mover", with: "John Doe"
      fill_in "Type of movement", with: ""
      fill_in "Reps", with: 10
      fill_in "Weight", with: 25

      click_button("Record Movement")
      
      expect(current_path).to eq(new_movement_path)
      expect(page).to have_content("Please fill in all required fields. You may leave Weight field blank if using just body weight.")
    end

    it 'when I fill in the form but leave reps field blank 
      and click the button, I stay on the new movement page and see a flash message
      telling me to fill in all required fields' do
      fill_in "Name of mover", with: "John Doe"
      fill_in "Type of movement", with: ""
      fill_in "Reps", with: ""
      fill_in "Weight", with: 25

      click_button("Record Movement")
      
      expect(current_path).to eq(new_movement_path)
      expect(page).to have_content("Please fill in all required fields. You may leave Weight field blank if using just body weight.")
    end
  end
end
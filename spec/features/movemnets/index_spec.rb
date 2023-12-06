require 'rails_helper'

RSpec.describe 'Movements Index Page' do
  describe 'As a visitor, when I visit the movements index page' do
    before :each do
      Movement.create!(
        name_of_mover: "John Doe",
        type_of_movement: "curls",
        reps: 10,
        weight: 20
      )
      movements = FactoryBot.create_list(:movement, 5)
      visit movements_path
    end

    it 'I see a table with all movement records' do
      expect(page).to have_content("Name of Mover")
      expect(page).to have_content("Type of Movement")
      expect(page).to have_content("Reps")
      expect(page).to have_content("Weight")
      expect(page).to have_content("Moved At")
      expect(page).to have_content("Delete Movement")
    end

    it 'I see a button to create a new movement' do
      expect(page).to have_button("Record Movement")
    end

    it 'has a button to delete each movement' do
      expect(page).to have_button("Delete", count: 6)
    end

    it 'when I click a delete button, I am taken back to the movements index page, I see a flash message confirming the successful delete,
      and I do not see the deleted record' do
      expect(page).to have_button("Delete", count: 6)
      expect(page).to have_content("John Doe")

      click_button("Delete", match: :first)

      expect(page).to have_button("Delete", count: 5)
      expect(page).to_not have_content("John Doe")
      expect(current_path).to eq(movements_path)
      expect(page).to have_content("Movement successfully deleted!")
    end
  end
end
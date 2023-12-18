require 'rails_helper'

RSpec.describe Movement, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name_of_mover }
    it { should validate_presence_of :type_of_movement }
    it { should validate_presence_of :reps }
  end

  describe 'class methods' do
    it 'can sort by newest first' do
      expect(Movement.newest_first).to eq(Movement.order(created_at: :desc))
    end
  end
end
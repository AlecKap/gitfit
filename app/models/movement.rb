class Movement < ApplicationRecord
  validates_presence_of :name_of_mover, :type_of_movement, :reps

  def self.newest_first
    order(created_at: :desc)
  end
end

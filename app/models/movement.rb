class Movement < ApplicationRecord
  validates_presence_of :name_of_mover, :type_of_movement, :reps
end

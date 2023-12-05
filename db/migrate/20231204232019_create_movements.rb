class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :name_of_mover
      t.string :type_of_movement
      t.integer :reps
      t.float :weight

      t.timestamps
    end
  end
end

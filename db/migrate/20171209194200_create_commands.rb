class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.integer :reps
      t.string :color1
      t.string :color2
      t.boolean :turn_off
      t.integer :space
      t.text :pattern

      t.timestamps
    end
  end
end

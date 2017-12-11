class AddLockToCommand < ActiveRecord::Migration[5.1]
  def change
    add_column :commands, :lock, :boolean
  end
end

class AddNameToTasks < ActiveRecord::Migration[4.2]
  def self.up
    add_column :tasks, :name, :string
  end

  def self.down
    remove_column :tasks, :name
  end
end

class AddRoleToUser < ActiveRecord::Migration[4.2]
  def self.up
    add_column :users, :role, :integer, :limit => 1 
  end

  def self.down
    remove_column :users, :role
  end
end

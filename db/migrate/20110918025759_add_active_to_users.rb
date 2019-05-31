class AddActiveToUsers < ActiveRecord::Migration[4.2]
  def self.up
    add_column :users, :active, :boolean
  end

  def self.down
    remove_column :users, :active
  end
end

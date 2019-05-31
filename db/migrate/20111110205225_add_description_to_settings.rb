class AddDescriptionToSettings < ActiveRecord::Migration[4.2]
  def self.up
    add_column :settings, :description, :string
  end

  def self.down
    remove_column :settings, :description
  end
end

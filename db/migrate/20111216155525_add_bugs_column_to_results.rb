class AddBugsColumnToResults < ActiveRecord::Migration[4.2]
  def self.up
    add_column :results, :bugs, :string
  end

  def self.down
    remove_column :results, :bugs
  end
end

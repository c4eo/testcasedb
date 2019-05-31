class AddExecutedAtToResults < ActiveRecord::Migration[4.2]
  def self.up
    add_column :results, :executed_at, :datetime
  end

  def self.down
    remove_column :results, :executed_at
  end
end

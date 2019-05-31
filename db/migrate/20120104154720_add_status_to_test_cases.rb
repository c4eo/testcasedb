class AddStatusToTestCases < ActiveRecord::Migration[4.2]
  def self.up
    add_column :test_cases, :status, :integer, :limit => 2
  end

  def self.down
    remove_column :test_cases, :status
  end
end

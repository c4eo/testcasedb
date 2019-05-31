class AddDeprecatedToTestCases < ActiveRecord::Migration[4.2]
  def self.up
    add_column :test_cases, :deprecated, :boolean, default: false
  end

  def self.down
    remove_column :test_cases, :deprecated
  end
end

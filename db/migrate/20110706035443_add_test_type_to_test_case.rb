class AddTestTypeToTestCase < ActiveRecord::Migration[4.2]
  def self.up
    add_column :test_cases, :test_type_id, :integer
  end

  def self.down
    remove_column :test_cases, :test_type_id
  end
end

class AddTestCaseToComment < ActiveRecord::Migration[4.2]
  def self.up
    add_column :comments, :test_case_id, :integer
  end

  def self.down
    remove_column :comments, :test_case_id
  end
end

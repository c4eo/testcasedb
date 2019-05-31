class AddTestCaseIdColumnToUploads < ActiveRecord::Migration[4.2]
  def self.up
    add_column :uploads, :test_case_id, :integer
  end

  def self.down
    remove_column :uploads, :test_case_id
  end
end

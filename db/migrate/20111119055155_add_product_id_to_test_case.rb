class AddProductIdToTestCase < ActiveRecord::Migration[4.2]
  def self.up
    add_column :test_cases, :product_id, :integer
  end

  def self.down
    remove_column :test_cases, :product_id
  end
end

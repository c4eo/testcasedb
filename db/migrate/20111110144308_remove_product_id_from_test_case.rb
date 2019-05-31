class RemoveProductIdFromTestCase < ActiveRecord::Migration[4.2]
  def self.up
    remove_column :test_cases, :product_id
  end

  def self.down
    add_column :test_cases, :product_id, :integer
  end
end

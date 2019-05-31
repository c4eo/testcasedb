class AddMoreColumnsToHistories < ActiveRecord::Migration[4.2]
  def self.up
    add_column :histories, :product_id, :integer
    add_column :histories, :category_id, :integer
  end

  def self.down
    remove_column :histories, :category_id
    remove_column :histories, :product_id
  end
end

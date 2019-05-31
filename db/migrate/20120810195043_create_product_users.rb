class CreateProductUsers < ActiveRecord::Migration[4.2]
  def self.up
    create_table :product_users do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_users
  end
end

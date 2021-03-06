class CreateAssignments < ActiveRecord::Migration[4.2]
  def self.up
    create_table :assignments do |t|
      t.text :notes
      t.integer :product_id
      t.integer :version_id
      t.integer :test_plan_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end

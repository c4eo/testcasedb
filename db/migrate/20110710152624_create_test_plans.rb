class CreateTestPlans < ActiveRecord::Migration[4.2]
  def self.up
    create_table :test_plans do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :test_plans
  end
end

class CreateResults < ActiveRecord::Migration[4.2]
  def self.up
    create_table :results do |t|
      t.integer :assignment_id
      t.integer :test_case_id
      t.string :result
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end

class CreateDevices < ActiveRecord::Migration[4.2]
  def self.up
    create_table :devices do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end

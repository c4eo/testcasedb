class AddDeviceIdToResults < ActiveRecord::Migration[4.2]
  def self.up
    add_column :results, :device_id, :integer
  end

  def self.down
    remove_column :results, :device_id
  end
end

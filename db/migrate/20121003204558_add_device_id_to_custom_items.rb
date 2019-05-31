class AddDeviceIdToCustomItems < ActiveRecord::Migration[4.2]
  def self.up
    add_column :custom_items, :device_id, :integer
  end

  def self.down
    remove_column :custom_items, :device_id
  end
end

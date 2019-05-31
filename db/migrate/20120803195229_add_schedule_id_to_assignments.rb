class AddScheduleIdToAssignments < ActiveRecord::Migration[4.2]
  def self.up
    add_column :assignments, :schedule_id, :integer
  end

  def self.down
    remove_column :assignments, :schedule_id
  end
end

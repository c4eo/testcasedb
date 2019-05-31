class AddAssignmentIdToTasks < ActiveRecord::Migration[4.2]
  def self.up
    add_column :tasks, :assignment_id, :integer
  end

  def self.down
    remove_column :tasks, :assignment_id
  end
end

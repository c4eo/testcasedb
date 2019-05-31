class AddTaskIdToComments < ActiveRecord::Migration[4.2]
  def self.up
    add_column :comments, :task_id, :integer
  end

  def self.down
    remove_column :comments, :task_id
  end
end

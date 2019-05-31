class AddTaskIdToHistories < ActiveRecord::Migration[4.2]
  def self.up
    add_column :histories, :task_id, :integer
  end

  def self.down
    remove_column :histories, :task_id
  end
end

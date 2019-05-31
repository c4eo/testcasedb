class AddAssignmentIdToCustomItems < ActiveRecord::Migration[4.2]
  def self.up
    add_column :custom_items, :assignment_id, :integer
  end

  def self.down
    remove_column :custom_items, :assignment_id
  end
end

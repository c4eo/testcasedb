class AddStencilIdToAssignments < ActiveRecord::Migration[4.2]
  def self.up
    add_column :assignments, :stencil_id, :integer
  end

  def self.down
    remove_column :assignments, :stencil_id
  end
end

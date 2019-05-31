class AddParentIdToStencils < ActiveRecord::Migration[4.2]
  def self.up
    add_column :stencils, :parent_id, :integer
  end

  def self.down
    remove_column :stencils, :parent_id
  end
end

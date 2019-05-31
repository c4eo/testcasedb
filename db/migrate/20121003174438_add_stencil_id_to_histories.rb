class AddStencilIdToHistories < ActiveRecord::Migration[4.2]
  def self.up
    add_column :histories, :stencil_id, :integer
  end

  def self.down
    remove_column :histories, :stencil_id
  end
end

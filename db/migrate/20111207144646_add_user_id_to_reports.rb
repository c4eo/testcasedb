class AddUserIdToReports < ActiveRecord::Migration[4.2]
  def self.up
    add_column :reports, :user_id, :integer
  end

  def self.down
    remove_column :reports, :user_id
  end
end

class AddSecondVersionIdToReports < ActiveRecord::Migration[4.2]
  def change
    add_column :reports, :second_version_id, :integer
  end
end

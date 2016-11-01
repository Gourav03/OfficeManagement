class RemoveLogoutTimeFromRecords < ActiveRecord::Migration[5.0]
  def change
  	remove_column :records, :logout_time, :datetime
  	add_column :records, :total_working_hours, :integer
  end
end

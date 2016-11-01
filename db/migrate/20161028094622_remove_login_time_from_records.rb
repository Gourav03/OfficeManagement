class RemoveLoginTimeFromRecords < ActiveRecord::Migration[5.0]
  def change
  	remove_column :records, :login_time, :datetime
  end
end

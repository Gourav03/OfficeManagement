class RemoveContactNumberFromProfile < ActiveRecord::Migration[5.0]
  def change
  	remove_column :profiles, :contact_number, :integer
  	add_column :profiles, :contact_number, :string
  	remove_column :records, :date, :datetime
  	add_column :records, :date, :date
  	remove_column :records, :total_working_hours, :integer
  	add_column :records, :total_working_hours, :float  	
  end
end

class AddColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :profiles, :data_of_birth
  	add_column :profiles, :date_of_birth, :date
  end
end

class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :designation
      t.string :address
      t.integer :age
      t.integer :contact_number
      t.datetime :data_of_birth
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.datetime :login_time
      t.datetime :logout_time
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

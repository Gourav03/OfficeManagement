class AddTokenToGallery < ActiveRecord::Migration[5.0]
  def change
  	add_column :galleries, :token, :string
  end
end

class AddGalleryTokenToPicture < ActiveRecord::Migration[5.0]
  def change
  	add_column :pictures, :gallery_token, :string
  end
end

class AddImagesToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :images, :json, null: false
  end
end

class RemoveColImagesInAlbum < ActiveRecord::Migration[6.0]
  def change
    remove_column :albums, :images, :string
  end
end

class AddPhotosCountToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :photos_count, :integer
  end
end

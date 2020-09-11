class ChangeAlbumRefNullToPhotoTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :photos, :album_id, true
  end
end

class ChangeColDefaultInAlbum < ActiveRecord::Migration[6.0]
  def change
    change_column_default :albums, :photos_count, from: nil, to: 0
  end
end

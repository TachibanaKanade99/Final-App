class AddAlbumRefToPhoto < ActiveRecord::Migration[6.0]
  def change
    add_reference :photos, :album, null: false, foreign_key: true
  end
end

class RemoveAlbumRefToPhoto < ActiveRecord::Migration[6.0]
  def change
    remove_reference :photos, :album
  end
end

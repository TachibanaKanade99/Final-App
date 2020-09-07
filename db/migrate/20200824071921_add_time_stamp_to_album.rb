class AddTimeStampToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :created_at, :datetime, null:false, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :albums, :updated_at, :datetime, null:false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

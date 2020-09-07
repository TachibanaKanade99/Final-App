class AddTimeStampToPhoto < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :created_at, :datetime, null:false, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :photos, :updated_at, :datetime, null:false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

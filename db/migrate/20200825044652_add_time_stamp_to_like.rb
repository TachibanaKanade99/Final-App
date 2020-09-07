class AddTimeStampToLike < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :created_at, :datetime, null:false, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :likes, :updated_at, :datetime, null:false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

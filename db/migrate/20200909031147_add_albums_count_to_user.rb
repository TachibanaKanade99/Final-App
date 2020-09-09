class AddAlbumsCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :albums_count, :integer
  end
end

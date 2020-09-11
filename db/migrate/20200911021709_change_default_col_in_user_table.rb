class ChangeDefaultColInUserTable < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :photos_count, from: nil, to: 0
    change_column_default :users, :albums_count, from: nil, to: 0
  end
end

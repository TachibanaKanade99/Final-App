class CreateAlbum < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title, :limit => 140, :null => false
      t.string :description, :limit => 300, :null => false
      t.string :sharing_mode,:null => false
    end
  end
end

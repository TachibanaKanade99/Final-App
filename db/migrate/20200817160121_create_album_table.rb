class CreateAlbumTable < ActiveRecord::Migration[6.0]
  OPTIONS = ['private', 'public']
  def change
    create_table :album_tables do |t|
      t.string :title, :limit => 140, :null => false
      t.string :description, :limit => 300, :null => false
      t.string :sharing_mode, :in => OPTIONS ,:null => false
    end
  end
end

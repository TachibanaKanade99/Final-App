class DropAlbumsPhotosJoinTable < ActiveRecord::Migration[6.0]
	def change
		drop_join_table :albums, :photos
	end
end

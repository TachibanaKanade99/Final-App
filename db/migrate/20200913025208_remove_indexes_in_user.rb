class RemoveIndexesInUser < ActiveRecord::Migration[6.0]
	def change
		remove_index :users, column: :email
		remove_index :users, column: :first_name
		remove_index :users, column: :last_name
		remove_index :users, column: :password
  	end
end

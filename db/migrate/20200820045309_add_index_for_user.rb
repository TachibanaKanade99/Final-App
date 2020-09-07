class AddIndexForUser < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :email, :unique => true
    add_index :users, :password
  end
end

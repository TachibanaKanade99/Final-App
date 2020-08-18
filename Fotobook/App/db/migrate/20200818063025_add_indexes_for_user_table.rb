class AddIndexesForUserTable < ActiveRecord::Migration[6.0]
  def change
    add_index :user_tables, :first_name
    add_index :user_tables, :last_name
    add_index :user_tables, :email, :unique => true
    add_index :user_tables, :password
  end
end

class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, :limit => 25, :null => false
      t.string :last_name, :limit => 25, :null => false
      t.string :email, :null => false
      t.string :password, :limit => 64, :null => false
    end
  end
end

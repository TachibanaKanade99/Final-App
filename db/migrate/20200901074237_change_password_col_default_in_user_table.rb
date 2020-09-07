class ChangePasswordColDefaultInUserTable < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :password, from: nil, to: 1234
  end
end

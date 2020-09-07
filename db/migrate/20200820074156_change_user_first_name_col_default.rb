class ChangeUserFirstNameColDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :first_name, from: nil, to: 'Tuan'
    change_column_default :users, :last_name, from: nil, to: 'Minh'
  end
end

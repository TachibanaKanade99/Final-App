class ChangeUserCols < ActiveRecord::Migration[6.0]
  def change
    # Database Authenticatable
    change_column_null :users, :email, false
    change_column_default :users, :email, from: nil , to: ""
    add_column :users, :encrypted_password, :string, null: false, default: ""

    # Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    # Rememberable
    add_column :users, :remember_created_at, :datetime

    # Confirmable
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable

    # Add Timestamps
    add_column :users, :created_at, :datetime, null:false, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :users, :updated_at, :datetime, null:false, default: -> { 'CURRENT_TIMESTAMP' }

  end
end

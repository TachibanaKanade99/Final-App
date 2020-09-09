class AddFollowsColsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :followings_count, :integer
    add_column :users, :followers_count, :integer
  end
end

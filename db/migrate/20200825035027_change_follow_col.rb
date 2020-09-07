class ChangeFollowCol < ActiveRecord::Migration[6.0]
  def up
    change_column :follows, :follower_id, :bigint
    change_column :follows, :followed_user_id, :bigint
  end

  def down 
    change_column :follows, :follower_id, :integer
    change_column :follows, :followed_user_id, :integer
  end
end

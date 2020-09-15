class AddIndexColsToFollow < ActiveRecord::Migration[6.0]
	def change
		add_index :follows, :follower_id
		add_index :follows, :followed_user_id
	end
end

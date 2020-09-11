require 'rails_helper'

RSpec.describe Follow, type: :model do
	it { should belong_to(:follower).class_name("User").with_foreign_key("follower_id") }
	it { should belong_to(:followed_user).class_name("User").with_foreign_key("followed_user_id") }  
end

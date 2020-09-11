require 'rails_helper'

RSpec.describe User, type: :model do
	describe "association" do
		it { should have_many(:albums).class_name('Album') }
		it { should have_many(:photos).class_name('Photo') }
		it { should have_many(:received_follows).with_foreign_key(:followed_user_id).class_name("Follow") }
		it { should have_many(:followers).through(:received_follows).source(:follower) }
		it { should have_many(:given_follows).with_foreign_key(:follower_id).class_name("Follow") }
		it { should have_many(:followings).through(:given_follows).source(:followed_user) }  
		it { should have_many(:likes).class_name('Like') }   
	end

	describe "validation" do
		# first_name
		it { should validate_length_of(:first_name).is_at_most(25).with_message("maximum 25 characters long") }
		it { should validate_presence_of(:first_name) }
		it { should allow_value("tuan").for(:first_name) }
		it { should_not allow_value("tuan123").for(:first_name) } 

		# last_name
		it { should validate_length_of(:last_name).is_at_most(25).with_message("maximum 25 characters long") }
		it { should validate_presence_of(:last_name) }
		it { should allow_value("tuan").for(:last_name) }
		it { should_not allow_value("tuan123").for(:last_name) }

		# email
		it { should validate_length_of(:email).is_at_most(255).with_message("maximum 255 characters long") }
		it { should validate_presence_of(:email) }
		# it { should validate_uniqueness_of(:email) }

		# password
		it { should validate_length_of(:password).is_at_most(64).with_message("maximum 64 characters long") }
		it { should validate_presence_of(:password) }
	end
end

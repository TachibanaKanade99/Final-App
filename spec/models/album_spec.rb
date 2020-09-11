require 'rails_helper'

RSpec.describe Album, type: :model do
	# Validation

	describe "validation" do
		# title
		it { should validate_length_of(:title).is_at_least(10).is_at_most(140) }
		it { should validate_presence_of(:title) }

		# description
		it { should validate_length_of(:description).is_at_most(300).allow_nil.with_message("maximum 300 characters long") }

		# sharing_mode
		it { should allow_value("public").for(:sharing_mode) }
		it { should allow_value("private").for(:sharing_mode) }
		it { should_not allow_value("blafaf").for(:sharing_mode) }
	end
	
	
	# Association
	
	describe "association" do
		it { should belong_to(:user) }
		it { should have_many(:photos) }
		it { should have_many(:likes) }  
	end
	


end

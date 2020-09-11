require 'rails_helper'

RSpec.describe "Signups", type: :request do
	it "render signup's form when request GET to new" do
		get "/users/sign_up"
		expect(response).to render_template(:sign_up)  
	end
end

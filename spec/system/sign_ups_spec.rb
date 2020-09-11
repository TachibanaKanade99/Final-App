require 'rails_helper'
# require 'webdriver'

RSpec.describe "SignUps", type: :system do
	before do
		driven_by(:selenium_chrome_headless)
	end

	it "does not fill in enough information" do
		visit "/users/sign_up"

		fill_in "First Name:",	with: "Hiiii"
		click_button "Signup"
		
		expect(page).to have_text("Last Name cannot be empty")
	end

	it "fill enough information" do
		visit "/users/sign_up"

		fill_in "First Name:",	with: "Hmmmm"
		fill_in "Last Name:",	with: "Hmmmmmmmm"
		fill_in "Email:",	with: "sad1222@yopmail.com"
		fill_in "Password:",	with: "12345678"
		fill_in "Password Confirmation:",	with: "12345678" 
		click_button "Signup"
		
		visit new_user_session_path
	end
end

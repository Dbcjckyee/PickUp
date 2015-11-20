require 'rails_helper'

Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


describe "User", js: true do
	let(:user) {FactoryGirl.create(:user)}
	context  "A User" do
		before do
			visit login_path
		end
		it "can login" do 
			fill_in "Email", with: user.email
			fill_in "Password", with: user.password
			click_on "Log in"
			expect(page).to have_content(user.email)

		end
	end
end
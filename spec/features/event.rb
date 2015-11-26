require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe "Event", js: true do 
	let(:new_event) {FactoryGirl.create(:event)}
	let(:user) {FactoryGirl.create(:user)}
		context "An Event" do 
			before do 
				visit login_path
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_on "Log in"
				expect(page).to have_content("Hi,")
				visit new_event_path
			end
			it "can be created successfully" do 
				fill_in "event_event_name", with: new_event.event_name
				fill_in "event_description", with: new_event.description
				select  "Basketball", from: 'event[sport]'
				select  "08 AM", from: 'event[start(4i)]'
				fill_in "event_date", with: new_event.date
				fill_in "event_participants", with: new_event.participants
				fill_in "event_location", with: new_event.location
				click_on "Create Event"
				expect(page).to have_content("Hi,")
			end
	end
end

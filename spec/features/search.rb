require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


describe "Search", js: true do
  let(:new_event) {FactoryGirl.create(:event)}
    it "can search for something successfully" do
      new_event #creates new event with MyString in its fields
      visit search_new_path
      fill_in "search[description]", with: "MyString"
      click_on "Search for events"
      expect(page).to have_content("MyString")
  end
end

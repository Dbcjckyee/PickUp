require 'rails_helper'
require 'spec_helper'


describe RsvpsController do
  before(:each) do
    @user1 = User.create(email: 'test@test.com', password:'testing', first_name:"steve")
    @user2 = User.create(email: 'test2@test.com', password:'testing', first_name:"steve")
    @user3 = User.create(email: 'test3@test.com', password:'testing', first_name:"steve")
    @event1 = Event.create(event_name: "blah", description: "This is some blah", sport: "blah the sport", start: "2000-01-01 22:44:00", date: "11/11/2015", participants: "3", location: "Blahland", creator_id: @user1.id)
    @rsvp1 = Rsvp.create(user_id: @user1.id, event_id: @event1.id, created_at: "2016-01-13 00:25:54")
    @rsvp2 = Rsvp.create(user_id: @user2.id, event_id: @event1.id, created_at: "2016-01-14 00:25:54")
    @rsvp2 = Rsvp.create(user_id: @user3.id, event_id: @event1.id, created_at: "2016-01-15 00:25:54")
  end

 describe 'rsvps#create' do
    it 'a created rsvp changes the rsvp count by one' do
      expect{Rsvp.create(user_id: @user1.id, event_id: @event1.id)
      }.to change{Rsvp.count}.by(1)
    end
  end

  # describe 'rsvps#destroy' do
  #   it 'gives the longest lasting guest host duties when original host leaves' do
  #     session[:user_id] = @user1.id
  #     delete :destroy, :id => @event1.id
  #     @event1.creator_id.should eq(@user2.id)
  #   end
  # end

end

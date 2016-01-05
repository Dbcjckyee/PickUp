require 'rails_helper'
require 'spec_helper'


describe EventsController do
  before(:each) do
    @user = User.create(email: 'test@test.com', password:'testing')
  end

  describe '#index' do
    before(:each) do
      get :index
    end

    # it 'returns a status of 200 if a user is logged in' do
    #   post sessions_path, { :email => @user.email, :password => @user.password }
    #   expect(response.status).to eq(200)
    # end

    # it 'assigns @events instance variable' do
    #   expect(assigns(:events)).to be_a(ActiveRecord::Relation)
    # end
  end

  describe '#create' do
    let(:post_route) {FactoryGirl.create(:event)}
    it 'returns a status of 302' do
      @user = User.create(email: 'test@test.com', password:'testing', first_name:"steve")
      session[:user_id] = @user.id
       post :create, { "event" => {"event_name" => "blah", "description" => "This is some blah", "sport" => "blah the sport", "start" => "10:00", "end" => "10:30", "date" => "11/11/2015", "participants" => "3", "location" => "Blahland"}}
      expect(response.status).to eq(302)
    end

    it 'saves event to the database' do
      expect{post_route}.to change{Event.count}.by(1)
    end
  end

  describe '#new' do
    it 'returns a status of 200' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe '#edit' do
    it 'returns a status of 200' do
      event = FactoryGirl.create(:event)
      get :edit, id: event
      expect(response.status).to eq(200)
    end
  end

  describe "#show" do
    it 'displays an event page' do
      event = FactoryGirl.create(:event)
      get :show, id: event
      assigns(:event).should eq(event)
    end
  end

  describe "#update" do
    it 'updates the events attributes' do
      event = FactoryGirl.create(:event)
      patch :update, {id: event, :event => {"event_name" => "poop"}}
      expect(event.reload.event_name).to eq("poop")
    end
  end

end

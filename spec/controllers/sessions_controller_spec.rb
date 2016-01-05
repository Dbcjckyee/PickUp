require 'rails_helper'
require 'spec_helper'

describe SessionsController do

  describe '#create' do
    before(:each) do
      @user = User.create(email: 'test@test.com', password:'testing', first_name:"steve")
    end

    it 'returns a status of 302 if a user is logged in correctly' do
      post :create, :session => {"email": "test@test.com", "password": "testing"}
      expect(response.status).to eq(302)
    end

  end

end
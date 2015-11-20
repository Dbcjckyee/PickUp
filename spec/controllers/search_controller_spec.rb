require 'rails_helper'
require 'spec_helper'

describe SearchController do

  describe 'search#new' do
    it 'returns a status of 200 for the new search form' do
      get :new
      expect(response.status).to eq(200)
    end

    it 'returns a status of 302 when a search happens' do
      get :search
      expect(response.status).to eq(302)
    end
  end
end

require 'rails_helper'
require 'spec_helper'

describe SearchController do

  describe 'search#new' do
    it 'returns a status of 200 when a search happens' do
      get :index, :search => {"description": "testing"}
      expect(response.status).to eq(200)
    end
  end

end

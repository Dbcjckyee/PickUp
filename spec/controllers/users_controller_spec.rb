require 'rails_helper'
require 'spec_helper'

describe UsersController do
	let(:user) { User.create(first_name: "robin", last_name: "choi", email: "robinchoii@gmail.com", password: "admin!", phone_number: "111-111-1111")}

	describe '#new' do
		it "should render a new form" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe '#create' do
		it "it responds with a status of 302 when a user is created" do
		post :create, { "user" => {first_name: "robin", last_name: "choi", email: "robinchoii@gmail.com", password: "admin!", phone_number: "111-111-1111"}}
		expect(response.status).to eq(302)
	end
end



end

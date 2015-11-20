require 'rails_helper'
require 'spec_helper'

describe UsersController do
	let(:user) { User.create(first_name: "robin", last_name: "choi", email: "robinchoii@gmail.com", password: "admin", phone_number: "111-111-1111")}

	describe '#new' do
		it "should render a new form" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	# describe '#create' do 
	# 	let(:new_user) {post :create  User.create(first_name: "justin", last_name: "yee", email: "justinyee@gmail.com", password: "admin", phone_number: "222-222-2221")}
	# 	context "when create is successful" do
	# 		it "it responds with a status of 302"
	# 		post :create, { user: new_user.attributes}
	# 		expect(response.status).to eq(302)
	# 	end
	# end



end

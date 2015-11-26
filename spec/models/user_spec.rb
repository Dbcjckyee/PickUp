require 'rails_helper'

describe User do 
	let(:user) { FactoryGirl.create(:user)}
	it {should validate_presence_of :first_name}
	it {should validate_presence_of :email}
	it {should validate_presence_of :password}
	it {should have_secure_password}
	it {should validate_length_of(:password).is_at_least(6)}
	it {should validate_uniqueness_of :email}
	

end


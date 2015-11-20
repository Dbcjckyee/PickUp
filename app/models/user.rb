class User < ActiveRecord::Base
  validates :first_name, :last_name,  presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 },  confirmation: true
	has_secure_password
end

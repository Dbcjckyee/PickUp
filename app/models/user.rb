class User < ActiveRecord::Base
  validates :first_name, :last_name,  presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 },  confirmation: true
	has_secure_password
	has_many :event_users
	has_many :attended_events, :through => 'event_users'
	has_many :created_events, :class_name => "Event",  :foreign_key => "creator_id"

end

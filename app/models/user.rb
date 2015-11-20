class User < ActiveRecord::Base
	has_secure_password
	has_many :event_users
	has_many :attended_events, :through => 'event_users'
	has_many :created_events, :class_name => "Event",  :foreign_key => "creator_id"

end

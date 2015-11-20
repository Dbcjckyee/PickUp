require 'elasticsearch/model'
class Event < ActiveRecord::Base
	belongs_to :creator, :class_name => "User"
	has_many :event_users
	has_many :attendees, :through =>"event_users"

end

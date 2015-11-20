class Event < ActiveRecord::Base
	require 'textacular'
	belongs_to :creator, :class_name => "User"
	has_many :event_users
	has_many :users, :through =>"event_users"

  validates :event_name, :sport, :start, :location, presence: true
end

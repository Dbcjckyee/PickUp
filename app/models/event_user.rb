class EventUser < ActiveRecord::Base
	belongs_to :user
  belongs_to :event
  # belongs_to :attended_event, :class_name => "Event"
end

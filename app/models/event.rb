class Event < ActiveRecord::Base
  validates :event_name, :sport, :start, :location, presence: true
end

class Event < ActiveRecord::Base
  validates :event_name, :sport, :start, :location, presence: true
  geocoded_by :location #takes the address in the location and submits it as an argument to :geocode
  after_validation :geocode #takes the :location argument and writes to the longitute latitude event fields
end

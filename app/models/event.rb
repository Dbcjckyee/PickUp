class Event < ActiveRecord::Base
  validates :event_name, :sport, :start, :location, presence: true
  geocoded_by :location
  after_validation :geocode
end

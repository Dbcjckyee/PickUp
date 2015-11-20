class Event < ActiveRecord::Base
require 'textacular'
  validates :event_name, :sport, :start, :location, presence: true
end

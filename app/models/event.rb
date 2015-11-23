class Event < ActiveRecord::Base
	require 'textacular'
	has_and_belongs_to_many :users

  scope :current, -> {where("date >= ?", Date.today)}
  validates :event_name, :sport, :start, :location, :date, presence: true


  def creator
    p self
    p User.find(self.creator_id)
  end

  geocoded_by :location
  after_validation :geocode

end

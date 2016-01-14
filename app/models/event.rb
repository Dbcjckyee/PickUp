class Event < ActiveRecord::Base
	require 'textacular'
	has_many :rsvps
  has_many :users, :through => :rsvps
  scope :current, -> {where("date >= ?", Date.today)}
  validates :event_name, :sport, :start, :location, :date, presence: true
  validates :participants, :numericality => { :greater_than =>0}
  validate :start_before_end

  def creator
    User.find(self.creator_id)
  end

  def start_before_end
    if self.end && self.end < start
      errors.add(:start, "Invalid end time")
    end
  end

  geocoded_by :location
  after_validation :geocode

end

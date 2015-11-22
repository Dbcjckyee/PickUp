class User < ActiveRecord::Base
  validates :first_name, :last_name,  presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
	has_and_belongs_to_many :events
  # has_many :attended_events, :through => 'event_users'

  def created_events
    Event.where(creator_id: self.id)
  end
end

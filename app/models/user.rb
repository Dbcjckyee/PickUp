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

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.first_name = auth_hash['info']['name']
    user.last_name = "twitterman"
    user.email = "#{auth_hash['info']['nickname']}@twitter.com"
    user.password = auth_hash['uid']
    user.save!
    user
  end
end

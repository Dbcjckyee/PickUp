class User < ActiveRecord::Base
  validates :first_name,  presence: true
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
    fullname = auth_hash['info']['name'].split(" ")
    user.first_name = fullname[0]
    if fullname.length > 1
      user.last_name = fullname[1..fullname.length-1].join(" ")
    else
      user.last_name = " "
    end
    user.email = "#{auth_hash['uid']}@#{auth_hash['provider']}.com"
    user.password = auth_hash['uid']
    # user.url = auth_hash['info']['urls'][user.provider.capitalize]

    user.save!
    user
  end
end

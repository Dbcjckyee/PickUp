require 'rails_helper'

describe Event do
	it {should validate_presence_of :event_name}
	it {should validate_presence_of :sport}
	it {should validate_presence_of :start}
	it {should validate_presence_of :location}
	it {should validate_presence_of :date}
	it {should have_many(:rsvps)}
  it {should have_many(:users)}

end

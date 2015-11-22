# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# @user = User.new(email: "wellington@wellington.com", password_digest: "password", first_name: "wellington", last_name: "wellington")
# User.create(email: "robin@robin.com", password_digest: "password", first_name: "robin", last_name: "robin")
# @user = User.create(email: "justin@justin.com", password_digest: "password", first_name: "justin", last_name: "justin")
# @user = User.create(email: "wei@wei.com", password_digest: "password", first_name: "wei", last_name: "wei")
Event.create(creator_id: rand(1..4), event_name: "Street Basketball", sport: "Basketball", start: "11:00:00", date: "2015-11-25", participants: 6, location: "633 Folsom St San Francisco, CA")
Event.create(creator_id: rand(1..4), event_name: "Street Soccer", sport: "Soccer", start: "10:00:00", date: "2015-11-15", participants: 16, location: "201 Harrison St San Francisco, CA")
Event.create(creator_id: rand(1..4), event_name: "Touch Football", sport: "Football", start: "10:00:00", date: "2015-11-19", participants: 10, location: "Dolores Park")
Event.create(creator_id: rand(1..4), event_name: "Street Soccer", sport: "Soccer", start: "10:00:00", date: "2015-11-25", participants: 22, location: "25712 Cannistraci Lane Hayward, CA")
Event.create(creator_id: rand(1..4), event_name: "Shoot Around", sport: "Soccer", start: "12:00:00", date: "2015-11-25", participants: 6, location: "San Francisco State University")
Event.create(creator_id: rand(1..4), event_name: "Bball", sport: "Basketball", start: "10:00:00", date: "2015-11-25", participants: 8, location: "Mission Rec San Francisco, CA")

# Pick Up

This is a Rails app that allows people to manage pick up, a.k.a. on-the-go, sporting activities, such as outdoor tennis and basketball. Users can create their own meetups and list them on the website. People who are interested in events can join in and search for more through a number of different criteria. The app maintains all event details, such as locations, attendance, attendee info, and more.

![Draftscreen](/app/assets/images/pickup.png)

# Demo

An online demo is available at http://pickuptheapp.herokuapp.com/

# Features

* Users can track and maintain their meetups from a dashboard.

* Users can search and filter through events by location, text, and sport.

* Displays event locations on interactive Google Maps.

* Maintains all meetup-related communications with the Rails's Action Mailer.

* Allows OAuth sign-ins through Facebook and Twitter.

# Installation

Clone this repo onto your desktop and run `bundle install` to retrieve the necessary gems.

  ```
  git clone https://github.com/Juxtaposeidon/PickUp.git
  bundle install
  ```
  
After installing the gems, you need to build out the database and migrations.

  ```
  rake db:create
  rake db:migrate
  ```

# Usage

After cloning the repo and installing the gems, you can run `rails s` to start your local server. The app can then be accessed at http://localhost:3000

# License

This project is licensed under the terms of the MIT license: https://github.com/IgorAntun/node-chat/blob/master/LICENSE.md


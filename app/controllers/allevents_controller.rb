class AlleventsController < ApplicationController

  def allevents
    @events = Event.all
  end

  def update
    @eventmatch = Event.where(sport: params[:sport])
    respond_to do |filter|
      filter.js
    end
  end

end

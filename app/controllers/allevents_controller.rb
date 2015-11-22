class AlleventsController < ApplicationController

  def allevents
    @events = Event.all
  end

  def update
    if params[:key] == "sport"
      @eventmatch = Event.where(sport: params[:sport])
    elsif params[:key] == "location"
      p request.location.city
      @eventmatch = Event.near("#{params[:lat]} , #{params[:long]}", (params[:location].to_i), :order => "distance")
    end
    @eventmatch
    respond_to do |filter|
      filter.js
    end
  end

end

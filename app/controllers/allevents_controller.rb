class AlleventsController < ApplicationController
  before_action :current_user

  def allevents
    @events = Event.current.order('event_name asc')
  end

  def update
    if params[:key] == "sport"
      @eventmatch = Event.current.where(sport: params[:sport]).order('event_name asc')
    elsif params[:key] == "location"
      @eventmatch = Event.current.near("#{params[:lat]} , #{params[:long]}", (params[:location].to_i), :order => "distance") #converts the params into a long/lat sequence and pulls
    elsif params[:key] == "date"
    @eventmatch = Event.where(date: eval(params[:date])).order('date asc')
    else
      @eventmatch = Event.current.order('event_name asc')
    end
    @eventmatch
    respond_to do |filter|
      filter.js
    end
  end
end

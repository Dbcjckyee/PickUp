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
      case params[:date]
      when "week"
        @eventmatch = Event.where(date: Date.today..1.week.from_now).order('date asc')
      when "2weeks"
        @eventmatch = Event.where(date: Date.today..2.weeks.from_now).order('date asc')
      when "3weeks"
        @eventmatch = Event.where(date: Date.today..3.weeks.from_now).order('date asc')
      when "month"
        @eventmatch = Event.where(date: Date.today..1.month.from_now).order('date asc')
      end
    else
      @eventmatch = Event.current.order('event_name asc')
    end
    p @eventmatch
    @eventmatch
    respond_to do |filter|
      filter.js
    end
  end

end

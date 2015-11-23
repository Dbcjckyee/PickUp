class AlleventsController < ApplicationController

  def allevents
    @events = Event.current
  end

  def update
    if params[:key] == "sport"
      @eventmatch = Event.current.where(sport: params[:sport])
    elsif params[:key] == "location"
      @eventmatch = Event.current.near("#{params[:lat]} , #{params[:long]}", (params[:location].to_i), :order => "distance") #converts the params into a long/lat sequence and pulls
    elsif params[:key] == "date"
      case params[:date]
      when "week"
        @eventmatch = Event.where(date: Date.today..1.week.from_now)
      when "2weeks"
        @eventmatch = Event.where(date: Date.today..2.weeks.from_now)
      when "3weeks"
        @eventmatch = Event.where(date: Date.today..3.weeks.from_now)
      when "month"
        @eventmatch = Event.where(date: Date.today..1.month.from_now)
      end
    else
      @eventmatch = Event.current
    end
    p @eventmatch
    @eventmatch
    respond_to do |filter|
      filter.js
    end
  end

end

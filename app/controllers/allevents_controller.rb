class AlleventsController < ApplicationController
  before_action :current_user

  def allevents
    @events = Event.current.order('event_name asc')
  end

  def update
    case params[:key]
    when "sport"
      @eventmatch = Event.current.where(sport: params[:sport]).order('event_name asc')
    when "location"
      @eventmatch = Event.current.near("#{params[:lat]} , #{params[:long]}", (params[:location].to_i), :order => "distance") #converts the params into a long/lat sequence and pulls
    when "date"
      @eventmatch = Event.where(date: eval(params[:date])).order('date asc')
    else
      @eventmatch = Event.current.order('event_name asc')
    end
    render :json => {:partial => render_to_string(:partial => 'allevents/resulttable')}
  end
end

class EventsController < ApplicationController
    before_action :current_user, :require_user, only: [:index, :show, :new]

  def index
    @events = Event.all
    @user = current_user
  end

  def join
    @event = Event.find(params[:id])
    @event.users << User.find(current_user.id)

    redirect_to events_path
  end

  def leave
    p params
    p @event = Event.find(params[:id])
    p @event.users.destroy(User.find(current_user.id))

    redirect_to user_path(@current_user)
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if @event.save
      redirect_to events_path
    end
  end

  def new
    @event = Event.new
  end

  def map
    coords = params[:latitude] + ", " + params[:longitude] #takes the longitude and lat from the AJAX call and concatenates them into a string
        p coords
    @nearevents = Event.near(coords, 20, :order => "distance").limit(10) #Runs the coords in Geocoder to find all events within 20(2nd arg) miles. It then sorts them by distance and limits the return array to 10 items. This also passes @nearevents into the function below.
    respond_to do |format|
      format.js #Because there is an AJAX call, Rails pings map.js.erb. Go to map.js.erb
    end
    # session[:long] = params[:longitude]
    # session[:lat] = params[:latitude]
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id]).destroy
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    redirect_to @event
  end

  def edit
    @event = Event.find(params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:event_name, :description, :sport, :start, :end, :date, :participants, :location)
    end
end

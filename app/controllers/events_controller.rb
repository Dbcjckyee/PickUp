class EventsController < ApplicationController
    before_action :current_user, :require_user, only: [:index, :show, :new, :edit]


  def index
    @events = Event.current
    @user = current_user

  end

  def join
    #rails ajax with remote true
    # respond_to do |x|
    #   x.js
    # end

    # p params
    @new_user = User.find(current_user.id)
    @event = Event.find(params[:id])
    unless @event.users.exists?(@new_user)
      @event.users << @new_user
      flash[:notice] = "You have joined this event!"
      UserMailer.event_confirm_email(User.find(current_user.id), @event).deliver_now
      UserMailer.join_notification(@event.creator, @event).deliver_now
    end
    redirect_to user_path(current_user)
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if @event.save
      UserMailer.event_creation_email(User.find(current_user.id), @event).deliver_now
      @event.users << User.find(current_user.id)
      redirect_to events_path
    else
      flash[:notice] = @event.errors.full_messages
      p @event.errors
      redirect_to new_event_path
    end
  end

  def creator_leave
    @event = Event.find(params[:id])
    @host = @event.creator
    @new_host = @event.users.last
    @attendees = @event.users.size
    if @attendees > 1
      @event.update_attribute(:creator_id, @new_host.id)
      @event.users.destroy(User.find(current_user.id))
    else
      @event.destroy
    end
      redirect_to user_path(current_user)
      #if no one left delete event
  end

  def leave
    @event = Event.find(params[:id])
    if @event.creator_id == current_user.id
      creator_leave
    else
      @event.users.destroy(User.find(current_user.id))
      redirect_to user_path(current_user)
    end
  end


  def new
    @event = Event.new
  end

  def map
    coords = params[:latitude] + ", " + params[:longitude] #takes the longitude and lat from the AJAX call and concatenates them into a string
    @nearevents = Event.current.near(coords, 20, :order => "distance").limit(10) #Runs the coords in Geocoder to find all events within 20(2nd arg) miles. It then sorts them by distance and limits the return array to 10 items. This also passes @nearevents into the function below.
    render :json => {:partial => render_to_string(:partial => 'events/map')}

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

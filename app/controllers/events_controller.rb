class EventsController < ApplicationController
    before_action :current_user, :require_user, only: [:index, :show, :new]

  def index
    @events = Event.all
    @user = current_user
    # @joined = Event.
  end

  def join
    p "-" * 50
    p @event = Event.find(params[:id])
    p @event.users << User.find(current_user.id)
    p "-" * 50

    redirect_to events_path
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

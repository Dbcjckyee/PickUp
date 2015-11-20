class EventsController < ApplicationController
  before_action :require_user, only: [:index, :show, :new]

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
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

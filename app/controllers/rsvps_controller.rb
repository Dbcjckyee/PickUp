include RsvpsHelper

class RsvpsController < ApplicationController

  def create
    @event = Event.find(params[:id])
    Rsvp.create(user_id: current_user.id, event_id: params[:id])
    unless @event.users.exists?(current_user)
      @event.users << current_user
      flash[:notice] = "You have joined this event!"
      UserMailer.event_confirm_email(User.find(current_user.id), @event).deliver_now
      UserMailer.join_notification(@event.creator, @event).deliver_now
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @event = Event.find(params[:id])
    tbd = Rsvp.where(event_id: params[:id], user_id: current_user.id)
    Rsvp.delete(tbd)
    if @event.creator_id == current_user.id
      creator_leave
    else
      redirect_to user_path(current_user)
    end
  end
end

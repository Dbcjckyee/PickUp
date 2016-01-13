include RsvpsHelper

class RsvpsController < ApplicationController

  def create
    @event = Event.find(params[:id])
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
    if @event.creator_id == current_user.id
      creator_leave
    else
      @event.users.destroy(User.find(current_user.id))
      redirect_to user_path(current_user)
    end
  end
end

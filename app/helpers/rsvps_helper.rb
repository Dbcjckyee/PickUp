module RsvpsHelper
  def creator_leave
    @event = Event.find(params[:id])
    @new_host = @event.users.last
    @attendees = @event.users.size
    if @attendees > 1
      @event.update_attribute(:creator_id, @new_host.id)
      @event.users.destroy(User.find(current_user.id))
    else
      @event.destroy
    end
      redirect_to user_path(current_user)
  end
end

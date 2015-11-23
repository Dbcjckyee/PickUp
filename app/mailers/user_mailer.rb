class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = about_path
    mail(to: @user.email, subject: "Welcome to PickUp")
  end

  def event_confirm_email(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: "PickUp: confirming #{@event.event_name}")
  end

  def event_creation_email(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: "PickUp: #{@event.event_name} has  been successfully created")
  end

  def join_notification(owner, event)
    @owner = owner
    @event = event
    mail(to: @owner.email, subject: "PickUp: #{@event.event_name} has received a signup")
  end
end

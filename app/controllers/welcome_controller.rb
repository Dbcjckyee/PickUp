class WelcomeController < ApplicationController
before_action :current_user
  def index
    if current_user
      redirect_to events_path
    end
    p request.location.city
    @events =Event.near("San Francisco").sample(3)

  end

  def about
  end

end

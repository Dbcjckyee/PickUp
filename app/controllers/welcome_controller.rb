class WelcomeController < ApplicationController
before_action :current_user
  def index
    if current_user
      redirect_to events_path
    end
    request.location.city

    @events =Event.current.near("San Francisco").sample(3)

  end

  def about
  	@events =Event.current.near("San Francisco").sample(3)
  end

end

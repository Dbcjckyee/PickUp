class WelcomeController < ApplicationController
before_action :current_user
  def index
    if current_user
      redirect_to events_path
    end
    p request.location.city

    @events =Event.current.near("San Francisco").sample(3)

    render 'welcome/index'

  end

  def about
  end

end

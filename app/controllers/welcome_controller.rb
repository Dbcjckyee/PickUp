class WelcomeController < ApplicationController
before_action :current_user
  def index
    p request.location.city
    @events =Event.near("San Francisco").sample(3)
    render 'welcome/index'
  end

  def about
  end

end

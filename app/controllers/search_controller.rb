class SearchController < ApplicationController
before_action :current_user
  def new
  end

  def index
    @events = Event.current.basic_search(params[:search][:description])
  end

end

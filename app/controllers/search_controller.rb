class SearchController < ApplicationController
before_action :current_user
  def new
  end

  def index
    p params[:search][:description]
    @events = Event.basic_search(params[:search][:description])

  end

  def search
    redirect_to search_path(params)
  end
end

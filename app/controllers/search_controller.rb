class SearchController < ApplicationController
before_action :current_user
  def new
  end

  def index
    p params[:search][:description]
    @events = Event.current.basic_search(params[:search][:description])

  end

  def search
    puts "FDJFDSDKJFLDSJF"
    redirect_to search_path(params)
  end
end

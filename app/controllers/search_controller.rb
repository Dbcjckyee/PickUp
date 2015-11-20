class SearchController < ApplicationController
  def search
    if params[:query].nil?
      @events = []
    else
      @events = Event.search params[:query]
    end
  end
end

require 'elasticsearch/model'
  class Event < ActiveRecord::Base
    include Elasticsearch::Model
    include Elasticsearch::Callbacks
  Event.import
end

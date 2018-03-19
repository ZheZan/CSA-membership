class Event < ActiveRecord::Base
    has_and_belongs_to_many :users
    def Event.sort
      return Event.order(:name)
    end
end

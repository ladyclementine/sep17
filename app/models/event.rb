class Event < ActiveRecord::Base
   belongs_to :week
   has_many :schedules
end

class EventType < ActiveRecord::Base
	belongs_to :package
	has_many :events
end

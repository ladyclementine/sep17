class Purchase < ActiveRecord::Base
	belongs_to :event
  belongs_to :buyer, class_name: 'User'
end

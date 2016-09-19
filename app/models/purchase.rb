class Purchase < ActiveRecord::Base
	belongs_to :event
  belongs_to :buyer, class_name: 'User'

  validate :validate_limit

  def self.delete_purchases(current_user, id_event)
  	self.destroy_all(buyer_id:current_user.id, event_id:id_event)
  end

  def check_limit
    self.event.remaining == 0 ? false : true
  end

  def validate_limit
    errors.add("Limit", "is invalid.") unless check_limit
  end

end

class Purchase < ActiveRecord::Base
	belongs_to :event
  belongs_to :buyer, class_name: 'User'

  before_create :check_limit

  def self.delete_purchases(current_user, id_event)
  	self.destroy_all(buyer_id:current_user.id, event_id:id_event)
  end

  def check_limit
    self.event.remaining == 0 ? false : true
  end

end

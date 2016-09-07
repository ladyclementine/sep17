class Purchase < ActiveRecord::Base
	belongs_to :event
  belongs_to :buyer, class_name: 'User'










  def self.create_purchases(current_user)
    package = Package.find(current_user.package_id)

  	current_user.get_cart_events.each do |event|
  		self.create(buyer_id:current_user.id, event_id:event.id)

  	end
  end

end

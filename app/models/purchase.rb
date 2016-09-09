class Purchase < ActiveRecord::Base
	belongs_to :event
  belongs_to :buyer, class_name: 'User'

  def self.create_purchases(current_user, id_event)
  	  event = Event.find(id_event)

      if event.remaining == event.limit
  		   self.create(buyer_id:current_user.id, event_id:id_event)
         true
      else
        false
      end

  	
  end

  def self.delete_purchases(current_user, id_event)
  	  

  		 self.destroy_all(buyer_id:current_user.id, event_id:id_event)
  		
  	
  end

  



end

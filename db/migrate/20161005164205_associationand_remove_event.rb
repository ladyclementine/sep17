class AssociationandRemoveEvent < ActiveRecord::Migration
  def self.up
  	
  	remove_reference :event_types, :event, index: true
  	add_reference :events, :event_type, index:true
  end
end

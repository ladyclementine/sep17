class RemoveColumn < ActiveRecord::Migration
  def self.up
  	remove_column :packages,  :price 
  end
end

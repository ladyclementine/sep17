class AddColumn < ActiveRecord::Migration
  def self.up
  	add_column :events,  :price, :decimal, :precision => 8, :scale => 2, :default => 0
  end
end

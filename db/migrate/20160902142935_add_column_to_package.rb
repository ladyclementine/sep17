class AddColumnToPackage < ActiveRecord::Migration
  def self.up
  	add_column :packages, :price, :decimal, :precision => 8, :scale => 2, :default => 0
  end
end

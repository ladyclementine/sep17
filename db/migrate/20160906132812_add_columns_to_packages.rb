class AddColumnsToPackages < ActiveRecord::Migration
  def self.up 
  	add_column :packages, :courses, :integer, default:0
  	add_column :packages, :lectures, :integer, default:0
  	add_column :packages, :visits, :integer, default:0
  end
end

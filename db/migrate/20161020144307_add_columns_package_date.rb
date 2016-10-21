class AddColumnsPackageDate < ActiveRecord::Migration
  def self.up
  	add_column :packages, :openning_date, :date
  	add_column :packages, :closure_date, :date
  end
end

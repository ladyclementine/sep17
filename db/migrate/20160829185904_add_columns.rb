class AddColumns < ActiveRecord::Migration
  def self.up
  	add_column :payments, :status, :string
  end
end

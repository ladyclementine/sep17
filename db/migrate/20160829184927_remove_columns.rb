class RemoveColumns < ActiveRecord::Migration
  


  def self.up
  remove_column :payments, :create_at, :update_at
  end
end

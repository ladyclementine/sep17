class AddColumnToTable < ActiveRecord::Migration
  def up
  	add_column :events, :limit, :integer
  end

  def down
  end
  
end

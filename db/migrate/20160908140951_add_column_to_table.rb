class AddColumnToTable < ActiveRecord::Migration
  def up
  	add_column :events, :limit, :integer, null: false, default: 0
  end

  def down
  end

end

class AdminsWeeks < ActiveRecord::Migration
  def change
  	create_table 'admins_weeks', id: false do |t|
      t.column :week_id, :integer
      t.column :admin_id, :integer
    end
  end
end

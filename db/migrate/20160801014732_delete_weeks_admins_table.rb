class DeleteWeeksAdminsTable < ActiveRecord::Migration
  def change
    drop_table :admins_weeks
  end
end

class AddWeekIdToAdmin < ActiveRecord::Migration
  def change
    add_reference :admins, :week, index: true
  end
end

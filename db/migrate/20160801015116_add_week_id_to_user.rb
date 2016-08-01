class AddWeekIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :week, index: true
  end
end

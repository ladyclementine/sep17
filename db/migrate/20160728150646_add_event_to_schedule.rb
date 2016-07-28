class AddEventToSchedule < ActiveRecord::Migration
  def change
    add_reference :schedules, :event, index: true, foreign_key: true
  end
end

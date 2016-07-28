class AddWeekToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :week, index: true, foreign_key: true
  end
end

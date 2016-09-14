class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps null: false
    end
  end
end

class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :method
      t.float :price
      t.datetime :create_at
      t.datetime :update_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

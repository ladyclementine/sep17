class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :method
      t.integer :portions
      t.integer :portions_paid
      t.float :price
      t.string :link_1
      t.string :link_2
      t.string :link_3
      t.string :link_4
      t.datetime :create_at
      t.datetime :update_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

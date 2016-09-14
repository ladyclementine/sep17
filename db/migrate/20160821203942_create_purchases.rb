class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :event_id, null: false
      t.integer :buyer_id, null: false
      t.timestamps null: false
    end
    add_index :purchases, [:event_id, :buyer_id], unique: true
  end
end

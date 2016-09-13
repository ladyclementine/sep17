class CreateInscriptionsTable < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
      t.integer :user_id, null: false
      t.integer :package_id, null: false
      t.timestamps null: false
    end
    add_index :inscriptions, [:user_id], unique: true
  end
end

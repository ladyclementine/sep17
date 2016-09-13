class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title, null: false
      t.text :description
      t.integer :limit, null: false
      t.string :price, null: false

      t.timestamps null: false
    end
  end
end

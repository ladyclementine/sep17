class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title
      t.text :description
      t.integer :limit
      t.string :price
      t.belongs_to :week, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

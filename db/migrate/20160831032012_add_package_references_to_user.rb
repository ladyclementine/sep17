class AddPackageReferencesToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :package, index: true
    end
  end
end

class AddPackageReferencesToUser < ActiveRecord::Migration
  def change
    add_reference :users, :package, index: true, foreign_key: true
  end
end

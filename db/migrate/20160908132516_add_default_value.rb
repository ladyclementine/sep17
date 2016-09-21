class AddDefaultValue < ActiveRecord::Migration
  def up
    change_column :payments, :status, :string
  end
end

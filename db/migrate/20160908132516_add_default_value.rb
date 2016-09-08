class AddDefaultValue < ActiveRecord::Migration
  def up
  change_column :payments, :status, :string, default: "pendente"
end

def down
 
end
end

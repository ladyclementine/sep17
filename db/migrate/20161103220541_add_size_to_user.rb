class AddSizeToUser < ActiveRecord::Migration
  def change
    add_column :users, :size, :string, presence: true
  end
end

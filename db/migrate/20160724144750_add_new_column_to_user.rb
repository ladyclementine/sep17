class AddNewColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :semester, :integer
    add_column :users, :course, :string
    add_column :users, :university, :string
    add_column :users, :birthday, :date
    add_column :users, :qualified, :boolean
  end
end

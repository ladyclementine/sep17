class CreateChallengeMembers < ActiveRecord::Migration
  def change
    create_table :challenge_members do |t|

      t.string :name, null: false
      t.string :email, null: false

      t.references :challenge_team
      t.timestamps null: false
    end
  end
end

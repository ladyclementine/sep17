class AddColumnPaymentStatusToChallengeTeam < ActiveRecord::Migration
  def change
    add_column :challenge_teams, :payment_status, :boolean, null: false, default: false
  end
end

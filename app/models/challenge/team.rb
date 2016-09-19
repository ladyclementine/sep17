class Challenge::Team < ActiveRecord::Base
  has_many :challenge_members,  class_name: 'Challenge::Member', foreign_key: :challenge_team_id, dependent: :restrict_with_error

  validates_presence_of :name, :limit, :email
end

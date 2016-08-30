class Challenge::Member < ActiveRecord::Base
  belongs_to :challenge_team, class_name: 'Challenge::Team'

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
end

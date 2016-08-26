class Challenge::Member < ActiveRecord::Base
  belongs_to :challenge_team, class_name: 'Challenge::Team'

  attr_accessor :name, :email
end

class Inscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  before_save :check_limit

  def check_limit
    self.package.remaining == 0 ? false : true
  end
end
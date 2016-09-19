class Inscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  validate :validate_limit

  def check_limit
    self.package.remaining == 0 ? false : true
  end

  def validate_limit
    errors.add("Limit", "is invalid.") unless check_limit
  end
end
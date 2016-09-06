class Package < ActiveRecord::Base
  has_many :users


  def remaining
    @remaining = self.limit - self.users.count
  end
end

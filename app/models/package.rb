class Package < ActiveRecord::Base

  has_many :inscriptions
  has_many :users, through: :inscriptions

  def remaining
    self.limit - self.inscriptions.count
  end

  def package_discount(current_user)
    package = self
    prices = Event.events_prices
    total_discount = 0
    if package_fit?(current_user)
      total_discount = prices[0]*package.lectures + prices[1]*package.courses + prices[2]*package.visits
    else
      total_discount = 0
    end
  end

  def package_fit?(current_user)
    count = Event.event_kind_count(current_user)
    package = self
    if count[:lectures] >= package.lectures && count[:visits] >= package.visits && count[:courses] >= package.courses
     true
    else
     false
    end
  end
end

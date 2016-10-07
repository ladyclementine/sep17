class Package < ActiveRecord::Base

  has_many :inscriptions
  has_many :packages_events_types
  has_many :users, through: :inscriptions
  has_many :event_types, through: :packages_events_types

  def remaining
    self.limit - self.inscriptions.count
  end

  def package_discount(current_user)
    package = self
    prices = Event.event_prices
    total_discount = 0

    if package_fit?(current_user)
      package.event_types.each do |type|
      total_discount += prices[type.name]*type.limit
    else
      total_discount = 0
    end
    total_discount
  end

  def package_fit?(current_user)
    count = Event.event_kind_count(current_user)
    package = self
    counter = 0
    package.event_types.each do |type|
      name = type.name
      if count[name] >= type.limit

       counter +=1
      end
    end

    if counter == package.event_types.count
      true
    else
      false
    end
  end
end
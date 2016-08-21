class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :payment
  has_many :purchases, foreign_key: :buyer_id
  has_many :events, through: :purchases
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def cart_count
    $redis.scard "cart#{id}"
  end


  def cart_total_price
   total_price = 0
   get_cart_events.each { |event| total_price+= event.price }
   total_price
  end

def get_cart_events
  cart_ids = $redis.smembers "cart#{id}"
  Event.find(cart_ids)
end


def purchase_cart_events!
  get_cart_events.each { |event| purchase(event) }
  $redis.del "cart#{id}"
end

def purchase(event)
  events << event unless purchase?(event)
end

def purchase?(event)
  events.include?(event)
end

end

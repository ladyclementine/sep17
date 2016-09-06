class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :payment
  has_many :purchases, foreign_key: :buyer_id
  has_many :events, through: :purchases
  belongs_to :package
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :name, presence: true, length: { maximum: 50 }
  validates :course, presence: true, length: { maximum: 60 }
  validates :university, presence: true, length: { maximum: 70 } 
  validates :semester, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }

  # before_save :set_package

  def cart_count
    $redis.scard "cart#{id}"
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

  def is_there_payment?
    self.payment.nil?
  end

  def is_there_package
    self.package.nil?
  end

  private
  def set_package
    flag = false
    if Package.count == 1  
      self.package = Package.first
      flag = true
    elsif Package.count > 1
      flag = true
    end
    flag
  end
end

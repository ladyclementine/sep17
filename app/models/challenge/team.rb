class Challenge::Team < ActiveRecord::Base
  has_many :challenge_members,  class_name: 'Challenge::Member', foreign_key: :challenge_team_id, dependent: :restrict_with_error

  validates_presence_of :name, :limit, :payment_method
  validates :email, presence: true, uniqueness: true

  validate :validate_payment_method

  def accepted_payment_methods
    ['Deposito', 'Transferencia', 'Presencial']
  end


  private
  def payment_is_valid?
    self.accepted_payment_methods.include? self.payment_method
  end

  def validate_payment_method
    errors.add("Método de pagamento", "é inválido.") unless payment_is_valid?
  end
end

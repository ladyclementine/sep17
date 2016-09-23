class PaymentMailer < ApplicationMailer
  def require_change(user)
    @user = user
    mail(to: Rails.application.secrets.sender_email, from: @user.email, subject: 'Solicitação de mudança de pagamento')
  end
end

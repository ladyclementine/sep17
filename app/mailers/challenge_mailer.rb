class ChallengeMailer < ApplicationMailer
  def inscription(team)
    @team = team
    @members = @team.challenge_members
    mail(to: Rails.application.secrets.sender_email, from: @team.email, subject: '[DESAFIO] Inscrição de Equipe')
  end

  def info(team, infos)
    @team  = team
    @infos = infos
    @members = @team.challenge_members
    mail(to: @team.email, from: Rails.application.secrets.sender_email, subject: '[DESAFIO] Confirmação de inscrição')
  end

  def confirm_payment(team)
    @team  = team
    mail(to: @team.email, from: Rails.application.secrets.sender_email, subject: '[DESAFIO] Confirmação de pagamento')
  end
end

class ChallengeMailer < ApplicationMailer
  def inscription(team)
    @team = team
    @members = @team.challenge_members
    mail(to: Rails.application.secrets.sender_email, from: @team.email, subject: '[DESAFIO] Inscrição de Equipe')
  end
end

module ApplicationHelper
  def current_week
    case Rails.application.secrets.week_id
    when "semana_test"
      @week = {name: 'Semana em Teste', colors: [base: '#FFFFFF'], logo: 'semana_test-logo.png'}
    else
      @week = {}
    end
  end
end

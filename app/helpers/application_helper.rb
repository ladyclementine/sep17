module ApplicationHelper
  def current_week
    case Rails.application.secrets.week_id
    when "semana_test"
      @week = {name: 'Semana em Teste', colors: [base: '#FFFFFF'], logo: 'semana_test-logo.png'}
    else
      @week = {}
    end
  end




  def flash_class(level)
    case level
        when 'notice' then "alert alert-dismissable alert-info"
        when 'success' then "alert alert-dismissable alert-success"
        when 'error' then "alert alert-dismissable alert-danger"
        when 'alert' then "alert alert-dismissable alert-danger"
    end
  end
end

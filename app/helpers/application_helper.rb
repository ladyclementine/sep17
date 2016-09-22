module ApplicationHelper
  def current_week
    case Rails.application.secrets.week_id
    when "semana_test"
      @week = { name: 'Semana em Teste', sigla: 'SeT', colors: { primary: '#871328', default: '#FFFFFF' }, logo: 'semana_test-logo.png', avatar: '' }
    when "stem"
      @week = { name: 'Semana da Engenharia Mecânica', sigla: 'STEM', colors: [primary: '#871328'], logo: 'stem-logo.png', avatar: 'stem-avatar.png' }
    when "sec"
      @week = { name: 'Semana da Engenharia Civil', sigla: 'SEC', colors: [base: '#FFFFFF'], logo: 'sec-logo.png' }
    when "setic"
      @week = { name: 'Semana de Tecnologia e Inovação', sigla: 'Setic', colors: [base: '#FFFFFF'], logo: 'setic-logo.png' }
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

  def time_pt(dt)
    dt.strftime("%d/%m/%Y às %H:%M")
  end
end

module ApplicationHelper
  def current_week
    case Rails.application.secrets.week_id
    when "semana_test"
      @week = { name: 'Semana em Teste', sigla: 'SeT', colors: [base: '#FFFFFF'], logo: 'semana_test-logo.png' }
    when "stem"
      @week = { name: 'Semana da Engenharia Mecânica', sigla: 'STEM', colors: [base: '#FFFFFF'], logo: 'stem-logo.png' }
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

  def link_to_add_fields(name = nil, f = nil, association = nil, options = nil, html_options = nil, &block)
    # If a block is provided there is no name attribute and the arguments are
    # shifted with one position to the left. This re-assigns those values.
    f, association, options, html_options = name, f, association, options if block_given?

    options = {} if options.nil?
    html_options = {} if html_options.nil?

    if options.include? :locals
      locals = options[:locals]
    else
      locals = { }
    end

    if options.include? :partial
      partial = options[:partial]
    else
      partial = association.to_s.singularize + '_fields'
    end

    # Render the form fields from a file with the association name provided
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: 'new_record') do |builder|
      render(partial, locals.merge!( f: builder))
    end

    # The rendered fields are sent with the link within the data-form-prepend attr
    html_options['data-form-prepend'] = raw CGI::escapeHTML( fields )
    html_options['href'] = '#'
    html_options['class'] = 'btn btn-primary waves-effect waves-light'
    content_tag(:a, name, html_options, &block)
  end
end

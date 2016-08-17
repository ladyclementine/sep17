module ApplicationHelper
  def current_tenant
    Week.find_by(subdomain: Apartment::Tenant.current)
  end

  def image_tenant
    if self.current_tenant
      "logos/#{self.current_tenant.subdomain}.png"
    else
      "logos/default.png"
    end
  end
  def page_title
    if self.current_tenant
      current_tenant.name
    else
      "Semana de Tecnologia"
    end
  end
end

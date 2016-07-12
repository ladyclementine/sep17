class PagesController < ApplicationController
  before_action :set_current_week, only: [:show]

	def index
    @weeks = Week.all
	end

  def show
  end

  private
  def set_current_week
    @current_week = Week.find_by(subdomain: Apartment::Tenant.current)
  end
end

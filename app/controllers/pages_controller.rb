class PagesController < ApplicationController
  before_action :set_current_week, only: [:show]

	def index
    @weeks = Week.all
	end

  def show
  end
  
end

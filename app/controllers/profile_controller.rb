class ProfileController < ApplicationController
	before_action :authenticate_user!, :get_user
  before_action :verify_packages, except: [:show]
	layout 'profile_layout'

  def show
    @events = Event.all
    @eventsDays = Event.days
    @scheduleHash = Event.appointments
    @number = 0    
  end

  protected
  def verify_packages
    if Package.count > 1
      if current_user.package.nil? && controller_path != 'packages'
        redirect_to :packages, notice: 'Usuário ainda não escolheu seu pacote.'
      end
    else
      if controller_path == 'packages'
        redirect_to :events, notice: 'Você já está inscrito noo pacote disponível.'
      end
    end
  end

  def get_user
    @user = current_user
  end
end

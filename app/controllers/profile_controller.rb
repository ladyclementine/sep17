class ProfileController < ApplicationController
	before_action :authenticate_user!, :get_user
  # before_action :verify_packages, except: [:events, :home]
	layout 'profile_layout'

  def home
    @user = current_user
    @user_package = @user.package
  end

  protected
  def verify_packages
    if Package.count > 1
      if current_user.package.nil? && controller_path != 'packages'
        redirect_to :packages, notice: 'Usuário ainda não escolheu seu pacote.'
      end
    else
      if controller_path == 'packages'
        redirect_to :events, notice: 'Você já está inscrito no pacote disponível.'
      end
    end
  end

  def get_user
    @user = current_user
  end
end

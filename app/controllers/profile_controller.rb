class ProfileController < ApplicationController
	before_action :authenticate_user!, :get_user
  before_action :verify_packages, except: [:events, :home]
	layout 'profile_layout'

  def home
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


  def verify_cart_count    
    package = Package.find(current_user.package_id)
    count = package.event_kind_count(current_user)
    lectures =  package.lectures - count[:lectures] 
    courses = package.courses - count[:courses]
    visits = package.visits - count[:visits]
    if !package.package_fit?(current_user)
      if count[:lectures] < package.lectures     
        redirect_to :events, notice:"adicione #{lectures} palestras ao seu carrinho para completar seu pacote"
      elsif count[:visits]<package.visits
        redirect_to :events, notice: " adicione #{visits} visitas ao seu carrinho para completar o pacote"
      elsif count[:courses]<package.visits
        redirect_to :events, notice: " adicione #{courses} mini-cursos ao seu carrinho para completar o pacote"
      end
    end
  end

  def get_user
    @user = current_user
  end
end

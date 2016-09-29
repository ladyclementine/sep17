class ProfileController < ApplicationController
	before_action :authenticate_user!, :get_user
	layout 'profile_layout'

  def home
    @user_package = @user.package
    @comments = Comment.all
  end

  def verify_cart_count
    package = @user.package
    count = Event.event_kind_count(current_user)
    if package && !package.package_fit?(current_user)
      lectures =  package.lectures - count[:lectures]
      courses = package.courses - count[:courses]
      visits = package.visits - count[:visits]
      if count[:lectures] < package.lectures
        redirect_to :events, notice:"adicione #{lectures} palestras ao seu carrinho para completar seu pacote"
      elsif count[:visits]<package.visits
        redirect_to :events, notice: " adicione #{visits} visitas ao seu carrinho para completar o pacote"
      elsif count[:courses]<package.courses
        redirect_to :events, notice: " adicione #{courses} mini-cursos ao seu carrinho para completar o pacote"
      end
    end
  end

  def get_user
    @user = current_user
  end
end

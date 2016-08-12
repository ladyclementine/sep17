class Users::SessionsController < Devise::SessionsController

  layout 'devise_layout'
  # before_action :configure_sign_in_params, only: [:create]
  before_filter :set_current_week

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  def set_current_week
    @current_week = Week.find_by(subdomain: Apartment::Tenant.current)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

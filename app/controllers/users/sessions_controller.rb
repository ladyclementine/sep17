class Users::SessionsController < Devise::SessionsController

  layout 'devise_layout'
  # before_action :configure_sign_in_params, only: [:create]
  before_filter :set_current_week

  # GET /resource/sign_in
  def new
    @user = User.new(sign_in_params)
    clean_up_passwords(@user)
    yield @user if block_given?
    respond_with(@user, serialize_options(@user))
  end

  # POST /resource/sign_in
  def create
    @user = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(:user, @user)
    yield @user if block_given?
    @user.week = @current_week
    respond_with @user, location: after_sign_in_path_for(@user)
  end

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

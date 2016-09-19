class Admin::AdminsController < Admin::BaseController
  before_action :set_admin_admin, only: [:show, :edit, :update, :destroy]

  # GET /admin/admins
  def index
    @admin_admins = Admin.all
  end

  # GET /admin/admins/1
  def show
  end

  # GET /admin/admins/new
  def new
    @admin_admin = Admin.new
  end

  # GET /admin/admins/1/edit
  def edit
  end

  # POST /admin/admins
  def create
    @admin_admin = Admin.new(admin_admin_params)
    generated_password = Devise.friendly_token.first(8)
    @admin_admin.password = generated_password
    if @admin_admin.save
      Admin::RegistrationMailer.welcome(@admin_admin, generated_password).deliver_now
      redirect_to [:admin, @admin_admin], notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/admins/1
  def update
    if @admin_admin.update(admin_admin_params)
      redirect_to [:admin, @admin_admin], notice: 'Admin was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/admins/1
  def destroy
    @admin_admin.destroy
    redirect_to admin_admins_url, notice: 'Admin was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_admin
    @admin_admin = Admin.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def admin_admin_params
    params.require(:admin).permit(:email)
  end
end

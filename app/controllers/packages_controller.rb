class PackagesController < ProfileController
  def index
    @packages = Package.all
    @package_1 = Package.first
    @user = current_user 
  end



  def add_package
  	@user.package_id = package_params[:package_id]
  	redirect_to :back
  end



  def package_params
    params.require(:user).permit(:package_id)
  end
end

class PackagesController < ProfileController
  def index
    
    @packages = Package.all
    @package_1 = Package.first
    @user = current_user 
  end



  def add_package
    
  	@user.package_id = params[:package_id]
    
    #limit = @packages.find_by(id:params[:package_id]).limit 
  	redirect_to :my_home, notice: 'Pacote escolhido com sucesso!'

  end



 # def package_params
  #  params.require(:user).permit(:package_id)
  #end
end

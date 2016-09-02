class PackagesController < ProfileController
  def index
    @packages = Package.all
    @package_1 = Package.first 
  end



  def add_package
  	
  	redirect_to :back
  end
end

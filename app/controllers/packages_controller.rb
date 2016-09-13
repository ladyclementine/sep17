class PackagesController < ProfileController
  before_action :set_package, only: [:add_package]

  def index
    @packages = Package.all
    @package_1 = Package.first
    @user = current_user
  end

  def add_package
    if @package.users << @user
      redirect_to :my_home, notice: 'Pacote escolhido com sucesso!'
    else
      render :index
    end
  end

  protected

  def set_package
    @package = Package.find(params[:package_id])
  end
end

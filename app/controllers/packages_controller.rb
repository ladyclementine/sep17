class PackagesController < ProfileController
  def index
    @packages = Package.all
  end
end

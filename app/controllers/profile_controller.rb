class ProfileController < ApplicationController
	before_action :authenticate_user!
  before_action :verify_packages
	layout 'profile_layout'

  protected
  def verify_packages
    if Package.count > 1
      if current_user.package.nil? && controller.controller_name != 'packages'
        redirect_to :packages_path
      end
    else
      if controller.controller_name == 'packages'
        redirect_to :events_path
      end
    end
  end
end

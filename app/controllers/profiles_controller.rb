class ProfilesController < ApplicationController
	before_action :authenticate_user!
	layout 'profile_layout'

	
  def index
  	@user = current_user
  end

  def week
@user = current_user
  end

  def weekUser
  end

end

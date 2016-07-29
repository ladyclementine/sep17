class Admin::BaseController < ApplicationController
  layout "admin_layout"
  before_action :authenticate_admin!
end

class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action  :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index
    @users = User.all
  end 
  
  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
end

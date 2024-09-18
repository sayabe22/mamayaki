class ApplicationController < ActionController::Base
  before_action :configure_authentication
  before_action :authenticate_user!, except: [:top]
  
  private
  
  def configure_authentication
    if admin_controller?
      authenticate_admin!
    end
  end
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
 
  def action_is_public?
    controller_name == 'homes' && action_name == 'top'
  end
  

  
end

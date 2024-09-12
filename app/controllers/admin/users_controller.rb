class Admin::UsersController < ApplicationController
  before_action  :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout 'admin'
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end
  
private
  
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end 
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
  
end
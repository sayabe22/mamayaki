class UsersController < ApplicationController
  def mypage
    @user = current_user
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end


  private
  
  def user_params
    params.require(:user).permit(:name, :profile, :is_active, :email, :encrypted_password)
  end 
  
end

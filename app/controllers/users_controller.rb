class UsersController < ApplicationController
  
  before_action :move_to_user_session, only: [:edit, :show, :destroy, :update]
  
  def mypage
    @user = current_user
    @posts = @user.posts.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end 

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to mypage_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to mypage_path
    else
      render :edit
    end 
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_user_registration_path
  end 

private
  
  def user_params
    params.require(:user).permit(:name, :profile, :is_active, :email, :encrypted_password, :profile_image)
  end 
  
  def move_to_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end

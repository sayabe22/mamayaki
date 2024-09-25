class Public::RelationshipsController < ApplicationController
  before_action :ensure_guest_user, only: [:create, :destroy]
  
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end 
  
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end 
  
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end 
  
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end 
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to request.referer, notice: "ゲストユーザーは閲覧のみ可能です。その他の機能はユーザー登録後に操作可能です。"
    end 
  end
  
end

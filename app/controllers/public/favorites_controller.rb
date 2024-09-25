class Public::FavoritesController < ApplicationController
  before_action :ensure_guest_user, only: [:create, :destroy]
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to request.referer
  end 

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to request.referer
  end
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to request.referer, notice: "ゲストユーザーは閲覧のみ可能です。その他の機能はユーザー登録後に操作可能です。"
    end 
  end
  
end

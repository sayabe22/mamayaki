class Admin::PostsController < ApplicationController
  def index
    @user = current_user
    if @user.email == 'guest@example.com'
       @posts = Post.page(params[:page]).order("created_at DESC")
    else
      @posts = Post.page(params[:page]).order("created_at DESC").where(user_id: [current_user.id, *current_user.following_ids])
    end
  end
end

class Admin::PostsController < ApplicationController
  layout 'admin'
  
  def index
    @user = current_user
    @posts = Post.page(params[:page]).order("created_at DESC")
  end


  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
end
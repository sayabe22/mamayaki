class PostsController < ApplicationController
  before_action :move_to_user_session, only: [:new, :edit, :show, :create, :destroy, :update]
  
  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(posts_params)
    @user = current_user
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "つぶやきました。"
      redirect_to post_path(@post)
    else
      render :new
    end
  end 

  def index
    @posts = Post.page(params[:page]).order("created_at DESC")
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
    unless @user.id == current_user.id
      redirect_to posts_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      flash[:notice] = "更新しました。"
      redirect_to post_path(@post)
    else
      flash[:notice] = "更新に失敗しました。"
      render :edit
    end
  end 
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end


private

  def posts_params
    params.require(:post).permit(:title, :body)
  end 
  
  def  move_to_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end  

end
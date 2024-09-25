class Public::PostsController < ApplicationController
  before_action :move_to_user_session, only: [:new, :edit, :show, :create, :destroy, :update]
  before_action :ensure_guest_user, only: [:new, :edit]
  
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
    @user = current_user
    if @user.email == 'guest@example.com'
       @posts = Post.page(params[:page]).order("created_at DESC")
    else
      @posts = Post.page(params[:page]).order("created_at DESC").where(user_id: [current_user.id, *current_user.following_ids])
    end
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
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーは閲覧のみ可能です。その他の機能はユーザー登録後に操作可能です。"
    end 
  end

end
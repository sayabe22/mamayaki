class PostsController < ApplicationController
  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "つぶやきました。"
      redirect_to post_path(@post)
    else
      render :new
    end
  end 

  def index
    @posts = Post.page(params[:page])
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
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
  
end
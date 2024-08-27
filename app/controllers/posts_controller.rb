class PostsController < ApplicationController
  def new
    @post = Post.new
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
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
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
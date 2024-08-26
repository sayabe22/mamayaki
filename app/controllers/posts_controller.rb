class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      flash[:notice] = "つぶやきました。"
      redirect_to post_path(@post)
    else
      render :index
    end
  end 

  def index
  end

  def show
  end

  def edit
  end



private

  def posts_params
    params.require(:post).permit(:title, :body)
  end 
end
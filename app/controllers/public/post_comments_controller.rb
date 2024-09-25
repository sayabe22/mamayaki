class Public::PostCommentsController < ApplicationController
  before_action :ensure_guest_user, only: [:create, :destroy]
  
  def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    @post_comment = PostComment.new
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    if comment.save
      flash[:notice] = "コメントしました。"
      redirect_to post_path(@post)
    else
      @error_comment = comment
      render 'public/posts/show'
    end
  end

  def destroy
    if PostComment.find(params[:id]).destroy
      flash[:notice] = "コメントを削除しました。"
      redirect_to post_path(params[:post_id])
    end
  end 
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
  def ensure_guest_user
    @user = current_user
    post = Post.find(params[:post_id])
    if @user.email == "guest@example.com"
      redirect_to post_path(post) , notice: "ゲストユーザーは閲覧のみ可能です。その他の機能はユーザー登録後に操作可能です。"
    end 
  end
  
end
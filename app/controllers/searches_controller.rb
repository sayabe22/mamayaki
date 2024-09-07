class SearchesController < ApplicationController
  before action :authenticate user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search for(@content, @method)
    else
      @records = Post.search for(@content, @method)
    end 
  end
end 
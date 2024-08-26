class UsersController < ApplicationController
  def mypage
    @user = current_user
  end

  def edit
  end

  def show
  end
end

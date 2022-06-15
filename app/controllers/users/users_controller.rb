class Users::UsersController < ApplicationController

  def show #ユーザー詳細
    @user = User.find(params[:id])
    post_comments = PostComment.where(user_id: @user).pluck(:work_id)
    @post_comments = Work.find(post_comments)
    @watchlists = Watchlist.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_user_path(current_user.id)
  end

  private

  def user_params
    params.permit(:name, :profile_image)
  end


end

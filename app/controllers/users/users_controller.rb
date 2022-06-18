class Users::UsersController < ApplicationController

  #ユーザー詳細
  def show
    @user = User.find(params[:id])
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @watchlists = Watchlist.where(user_id: @user)
    post_comments = PostComment.where(user_id: @user).pluck(:work_id)
    @post_comments = Work.find(post_comments)
  end

  #フォロー一覧
  def follows
    user = User.find(params[:id])
    @users = user.following_user.reverse_order
  end

  #フォロワー一覧
  def followers
    user = User.find(params[:id])
    @users = user.follower_user.reverse_order
  end

  #ユーザー情報編集
  def edit
    @user = User.find(params[:id])
  end

  #ユーザー情報更新
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

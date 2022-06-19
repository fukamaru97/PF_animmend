class Users::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create # フォロー
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy # アンフォロー
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

end

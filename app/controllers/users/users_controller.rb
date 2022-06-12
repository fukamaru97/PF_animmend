class Users::UsersController < ApplicationController

  def show #ユーザー詳細
    @user = User.find(params[:id])
  end

  def edit
  end
end

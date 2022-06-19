class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

　#ユーザー一覧
  def index
    @users = User.all
  end

end

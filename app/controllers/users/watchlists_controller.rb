class Users::WatchlistsController < ApplicationController
  before_action :authenticate_user!

  #ウォッチリストに入れる
  def create
    @work = Work.find(params[:work_id])
    watchlist = @work.watchlists.new(user_id: current_user.id)
    if watchlist.save
      redirect_to work_path(@work)
    else
      redirect_to work_path(@work)
    end
  end

  #ウォッチリストから外す
  def destroy
    @work = Work.find(params[:work_id])
    watchlist = @work.watchlists.find_by(user_id: current_user.id)
    if watchlist.present?
        watchlist.destroy
        redirect_to work_path(@work)
    else
        redirect_to work_path(@work)
    end
  end

end
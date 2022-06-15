class Users::WatchlistsController < ApplicationController

  def create
    @work = Work.find(params[:work_id])
    watchlist = @work.watchlists.new(user_id: current_user.id)
    if watchlist.save
      redirect_to users_work_path(@work)
    else
      redirect_to users_work_path(@work)
    end
  end

  def destroy
    @work = Work.find(params[:work_id])
    watchlist = @work.watchlists.find_by(user_id: current_user.id)
    if watchlist.present?
        watchlist.destroy
        redirect_to users_work_path(@work)
    else
        redirect_to users_work_path(@work)
    end
  end

end
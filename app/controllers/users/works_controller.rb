class Users::WorksController < ApplicationController

  def index
    @works = params[:tag_id].present? ? Tag.find(params[:tag_id]).works : Work.all
    #タグの指定があれば該当の作品を表示、指定がないときは全ての作品を表示
  end

  def show
    @work = Work.find(params[:id])
    @work_tags = @work.tags
    @post_comment = PostComment.new
    @user = User.find(params[:id])
  end

end
class Users::WorksController < ApplicationController
  before_action :authenticate_user!

  def index #作品一覧
    @works = params[:tag_id].present? ? Tag.find(params[:tag_id]).works : Work.all
    #タグの指定があれば該当の作品を表示、指定がないときは全ての作品を表示
  end

  def search #作品検索
    @works = Work.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def show #作品詳細
    @works = Work.all
    @work = Work.find(params[:id])
    @work_tags = @work.tags
    @post_comment = PostComment.new
  end

   private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end


end
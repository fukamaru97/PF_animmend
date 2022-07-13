class Users::WorksController < ApplicationController
  before_action :authenticate_user!

  #作品一覧
  def index
    @works = params[:tag_id].present? ? Tag.find(params[:tag_id]).works.page(params[:page]) : Work.page(params[:page]).per(12)
    #タグの指定があれば該当の作品を表示、指定がないときは全ての作品を表示
  end

  #作品検索
  def search
    @works = Work.search(params[:keyword]).page(params[:page]).per(12)
    @keyword = params[:keyword]
    render "index"
  end

  def show #作品詳細
    @works = Work.all
    @work = Work.find(params[:id])
    @work_tags = @work.tags
    @post_comment = PostComment.new
  end

end
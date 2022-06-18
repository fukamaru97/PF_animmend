class Admins::WorksController < ApplicationController

  #作品登録
  def new
    @work = Work.new
  end

  #作品情報保存
  def create
    @work = Work.new(work_params)
    if @work.save
   　   redirect_to admins_works_path
    else
   　　  render :new
    end
  end

  #作品一覧
  def index
    #タグの指定があれば該当の作品を表示、指定がないときは全ての作品を表示
    @works = params[:tag_id].present? ? Tag.find(params[:tag_id]).works : Work.all
  end

  #作品検索
  def search
    @works = Work.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  #作品詳細
  def show
    @work = Work.find(params[:id])
    @work_tags = @work.tags
    @post_comment = PostComment.new
  end

  #作品情報編集
  def edit
    @work = Work.find(params[:id])
  end

  #作品情報更新
  def update
    work = Work.find(params[:id])
    work.update(work_params)
    redirect_to admins_work_path(work.id)
  end

  #作品削除
  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to admins_works_path
  end

  private

  def work_params
    params.require(:work).permit(:name, :image, :story, tag_ids: [])
  end

end

class Admins::WorksController < ApplicationController

  def new #作品登録
    @work = Work.new
  end

  def create #作品情報保存
    @work = Work.new(work_params)
    if @work.save
     redirect_to admins_works_path
    else
     render :new
    end
  end

  def index #作品一覧
    @works = Work.all
    @genres = Genre.all
  end

  def show #作品詳細
    @work = Work.find(params[:id])
  end

  def edit #作品情報編集
    @work = Work.find(params[:id])
  end

  def update #作品情報更新
    work = Work.find(params[:id])
    work.update(work_params)
    redirect_to admins_work_path(work.id)
  end

  def destroy #作品削除
    work = Work.find(params[:id])
    work.destroy
    redirect_to admins_works_path
  end

  private

  def work_params
    params.require(:work).permit(:name, :image, :story, :genre_id)
  end

end

class Admins::WorksController < ApplicationController

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
     redirect_to admins_works_path
    else
     render :new
    end
  end

  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update(work_params)
    redirect_to admins_work_path(work.id)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to admins_works_path
  end

  private

  def work_params
    params.require(:work).permit(:name, :image, :story)
  end

end

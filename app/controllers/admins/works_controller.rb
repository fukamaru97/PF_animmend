class Admins::WorksController < ApplicationController
  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.save
    redirect_to admins_works_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def work_params
    params.require(:work).permit(:name, :image, :story)
  end

end

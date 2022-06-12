class Admins::GenresController < ApplicationController

  def create #ジャンル情報保存
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_path
  end

  def index #ジャンル一覧
    @genre = Genre.new
    @genres = Genre.all
  end

  def destroy #ジャンル削除
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end

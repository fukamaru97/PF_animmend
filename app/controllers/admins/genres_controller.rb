class Admins::GenresController < ApplicationController

  def new #ジャンル登録
    @genres = Genre.new
  end

  def create #ジャンル情報保存
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_path
  end

  def index #ジャンル一覧
    @genres = Genre.all
  end

  def edit #ジャンル情報編集
    @genre = Genre.find(params[:id])
  end

  def update #ジャンル情報更新
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admins_genre_path(genre.id)
  end

  def destroy #ジャンル削除
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admins_genres_path
  end

  private

  def genre_params
    params.permit(:name)
  end

end

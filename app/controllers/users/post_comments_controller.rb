class Users::PostCommentsController < ApplicationController

  #コメント投稿
  def create
    work = Work.find(params[:work_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.work_id = work.id
    comment.save
    redirect_to work_path(work.id)
  end

  #コメント削除
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to work_path(params[:work_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end

end

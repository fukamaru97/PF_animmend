class Admins::PostCommentsController < ApplicationController

  #コメント削除
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admins_work_path(params[:work_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end

end

class Users::PostCommentsController < ApplicationController

  def create
    work = Work.find(params[:work_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.work_id = work.id
    comment.save
    redirect_to users_work_path(work.id)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to users_work_path(params[:work_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end

end

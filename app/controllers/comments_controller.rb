class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to post_path(comment.post.id)
    else
      redirect_to post_path(comment.post.id)
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    if comment.destroy 
      redirect_to post_path(comment.post_id)
    else
      redirect_to root_path, alert: "権限がありません"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

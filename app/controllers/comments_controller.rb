class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id].to_i
    @comment.content = params[:content]
    # @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger] = 'コメントできませんでした'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end
end

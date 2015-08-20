class CommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment successfully deleted."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error deleting comment. Please try again."
      redirect_to [@topic, @post]
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end

class CommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])

    @comments = @post.comments

    @comment = Comment.new( comment_params )
    @comment.user = current_user
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment successfully deleted."
    else
      flash[:error] = "Error deleting comment. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end

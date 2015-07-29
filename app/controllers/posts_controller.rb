class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post)
    authorize @posts
  end

  def show
    @post = policy_scope(Post).find(params[:id])
  end

  def new
    @post = policy_scope(Post).new
    authorize @post
  end

  def create
    @post = policy_scope(Post).new(params.require(:post).permit(:title, :body))
    @post.user = current_user
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = policy_scope(Post).find(params[:id])
    authorize @post
  end

  def update
    @post = policy_scope(Post).find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end

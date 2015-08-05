class SummaryController < ApplicationController
  def show
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.new
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:body, :post_id))
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

  def edit
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end

  def update
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    if @summary.update_attributes(params.require(:summary).permit(:body, :post_id))
      flash[:notice] = "Summary was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :edit
    end
  end
end

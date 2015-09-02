class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "You have favorited this post"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was a problem favoriting this post. Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Favorite removed."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was a problem removing this favorite. Please try again."
      redirect_to [post.topic, post]
    end
  end

end

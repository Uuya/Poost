class PostsController < ApplicationController
before_action :authenticate_user!
layout 'index'

  def index
    @posts = Post.all.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to "/posts"
  end

  def show
    @post = Post.find(id_params[:id])
    @fav  = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
  end

  def destroy
    post = Post.find(id_params[:id])
    if post.user_id == current_user.id
       post.destroy
       redirect_to "/posts"
     else
       redirect_to "/posts"
    end
  end

  def fav
    post = Post.find(params[:id])
    if post.favorited_by?(current_user)
      fav = current_user.favorites.find_by(post_id: post.id)
      fav.destroy
      render json: post.id
    else
      fav = current_user.favorites.new(post_id: post.id)
      fav.save
      render json: post.id
    end
  end

  private

  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end

  def id_params
    params.permit(:id)
  end
end

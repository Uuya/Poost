class PostsController < ApplicationController
before_action :authenticate_user!

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

  private

  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end

  def id_params
    params.permit(:id)
  end
end

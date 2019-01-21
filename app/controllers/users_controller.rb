class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'index'

  def show
    @posts = Post.where(user_id: params[:id]).order("created_at desc")
    @fav_posts = Favorite.where(user_id: params[:id])
    @user = User.find_by(id: params[:id])
  end

end

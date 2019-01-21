class FavoritesController < ApplicationController
before_action :authenticate_user!
layout 'index'

def index
 @favs = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
end

end

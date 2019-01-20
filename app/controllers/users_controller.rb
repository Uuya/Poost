class UsersController < ApplicationController
  layout 'index'

  def show
    @user = User.find_by(id: params[:id])
  end

end

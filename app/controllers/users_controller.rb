class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @posts = user.posts.order('created_at DESC')
    @profile = user.profile
  end
end

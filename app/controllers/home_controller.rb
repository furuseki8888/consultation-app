class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user).order('created_at DESC').limit(5)
  end
end

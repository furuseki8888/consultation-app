class PostsController < ApplicationController
  before_action :login_required, only: [:new, :create]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  def login_required
    unless user_signed_in?
      redirect_to root_path
    end
  end
end

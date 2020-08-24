class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  before_action :login_required, only: [:new, :create]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿が完了しました"
    else
      render :new
    end
  end

  def show
    @like = Like.new
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def login_required
    unless user_signed_in?
      redirect_to root_path, notice: "ログインしてください"
    end
  end
end

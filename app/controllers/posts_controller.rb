class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :login_required, except: [:index, :show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

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

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy 
      redirect_to root_path, notice: "投稿の削除が完了しました"
    else
      redirect_to root_path, notice: "権限がありません"
    end
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
      redirect_to root_path, alert: "ログインしてください"
    end
  end

  def ensure_correct_user
    if @post.user_id != current_user.id
      redirect_to root_path, alert: '権限がありません'
    end
  end
end

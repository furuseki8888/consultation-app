class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC')
    @profile = @user.profile
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password)
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to root_path, alert: '権限がありません'
    end
  end
end

class ProfilesController < ApplicationController
  before_action :set_profile
  before_action :ensure_correct_user

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :prefecture_id, :introduction, :image).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def ensure_correct_user
    if @profile.user_id != current_user.id
      redirect_to root_path, alert: '権限がありません'
    end
  end
end

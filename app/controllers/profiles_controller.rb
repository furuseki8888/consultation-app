class ProfilesController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update]}
  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
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

  def ensure_correct_user
    @profile = Profile.find_by(id: params[:id])
    if @profile.user_id != current_user.id
      redirect_to root_path, notice: '権限がありません'
    end
  end
end

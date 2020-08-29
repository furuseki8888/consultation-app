require 'rails_helper'
RSpec.describe Profile, type: :model do
  describe '#create' do
    context 'プロフィール登録ができる' do
      it '必須項目が全て入力してあれば登録できる' do
        expect(build(:profile)).to be_valid
      end

      it "prefecture_idが空でも登録できる" do
        profile = build(:profile, prefecture_id: nil)
        expect(profile).to be_valid
      end

      it "introductionが空でも登録できる" do
        profile = build(:profile, introduction: nil)
        expect(profile).to be_valid
      end

      it "imageが空でも登録できる" do
        profile = build(:profile, image: nil)
        expect(profile).to be_valid
      end
    end

    context 'プロフィール登録ができない' do
      it "nicknameがない場合は登録できないこと" do
        profile = build(:profile, nickname: nil)
        profile.valid?
        expect(profile.errors[:nickname]).to include("を入力してください")
      end
    end
  end
end
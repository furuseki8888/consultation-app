require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    context 'ユーザー登録ができる' do
      it "必須項目が全て入力してあれば登録できる" do
        expect(build(:user)).to be_valid
      end

      it "passwordが6文字以上であれば登録できること" do
        user = build(:user, password: "888888", password_confirmation: "888888")
        expect(user).to be_valid
      end
    end

    context 'ユーザー登録ができない' do
      it "last_nameがない場合は登録できないこと" do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end
  
      it "first_nameがない場合は登録できないこと" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end
  
      it "last_name_kanaがない場合は登録できないこと" do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end
  
      it "first_name_kanaがない場合は登録できないこと" do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end
    
      it "emailがない場合は登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
  
      it "passwordがない場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
  
      it "passwordが存在してもpassword_confirmationが空の場合は登録できないこと" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "重複したemailが存在する場合は登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

      it " passwordが5文字以下であれば登録できないこと " do
        user = build(:user, password: "88888", password_confirmation: "888888")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end

      it "last_name_kanaが全角平仮名でないと登録できないこと" do
        user = build(:user, last_name_kana: "サンプル")
        user.valid?
        expect(user.errors[:last_name_kana]).to include("は不正な値です")
      end
  
      it "first_name_kanaが全角平仮名でないと登録できないこと" do
        user = build(:user, first_name_kana: "サンプル")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("は不正な値です")
      end
    end
  end
end
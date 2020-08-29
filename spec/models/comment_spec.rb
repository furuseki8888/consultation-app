require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe '#create' do
    context 'コメント投稿ができる' do
      it '必須項目が全て入力してあれば投稿できる' do
        expect(build(:comment)).to be_valid
      end
    end

    context 'コメント投稿ができない' do
      it "contentがない場合は登録できないこと" do
        comment = build(:comment, content: nil)
        comment.valid?
        expect(comment.errors[:content]).to include("を入力してください")
      end
    end
  end
end
require 'rails_helper'
RSpec.describe Post, type: :model do
  describe '#create' do
    context '記事投稿ができる' do
      it '必須項目が全て入力してあれば投稿できる' do
        expect(build(:post)).to be_valid
      end

      it "titleが空でも登録できる" do
        post = build(:post, title: nil)
        expect(post).to be_valid
      end
    end

    context '記事投稿ができない' do
      it "contentがない場合は登録できないこと" do
        post = build(:post, content: nil)
        post.valid?
        expect(post.errors[:content]).to include("を入力してください")
      end
    end
  end
end
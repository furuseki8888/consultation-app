class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, presence: true
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end

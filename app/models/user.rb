class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, presence: true
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
end

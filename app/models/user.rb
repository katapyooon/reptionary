class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーは複数の爬虫類を持つ
  has_many :my_reptiles, dependent: :destroy
  # ユーザーは複数のウィッシュリスト爬虫類を持つ
  has_many :wishlist_reptiles, dependent: :destroy
end

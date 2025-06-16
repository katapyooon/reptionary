class WishlistReptile < ApplicationRecord
  belongs_to :user

  validates :species, presence: true
  # morph と priority と memo は任意なので、バリデーション不要
end

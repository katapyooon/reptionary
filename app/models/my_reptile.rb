class MyReptile < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  # 画像のバリデーションは常に適用
  validates :image, presence: true

  # 他のバリデーションは保存時のみ適用
  with_options on: :save_with_validation do
    validates :name, presence: true
    validates :birthday, presence: true
    validates :adoption_date, presence: true
  end

  attr_accessor :crop_x, :crop_y, :crop_width, :crop_height
end

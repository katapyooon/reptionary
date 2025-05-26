class MyReptile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :birthday, presence: true
  validates :adoption_date, presence: true
  validates :image, presence: true

  # CarrierWave アップローダーをマウント
  mount_uploader :image, ImageUploader

  # Crop用の属性を追加
  attr_accessor :crop_x, :crop_y, :crop_width, :crop_height
end

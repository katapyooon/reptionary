class MyReptile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  # CarrierWave アップローダーをマウント
  mount_uploader :image, ImageUploader
end

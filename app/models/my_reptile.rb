class MyReptile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :birthday, presence: true
  validates :adoption_date, presence: true
  validates :image, presence: true

  # CarrierWave アップローダーをマウント
  mount_uploader :image, ImageUploader
end

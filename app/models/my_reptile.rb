class MyReptile < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  # 画像のバリデーションは常に適用
  validates :image, presence: true, if: :new_record?

  # 他のバリデーションは保存時のみ適用
  with_options on: :save_with_validation do
    validates :name, presence: true
    validates :birthday, presence: true
    validates :adoption_date, presence: true
  end

  attr_accessor :crop_x, :crop_y, :crop_width, :crop_height

  def days_since_birth
    return nil unless birthday.present?
    (Date.current - birthday).to_i
  end

  def days_since_adoption
    return nil unless adoption_date.present?
    (Date.current - adoption_date).to_i
  end
end

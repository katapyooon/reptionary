class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick
  # Include RMagick, MiniMagick, or Vips support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::Vips

  # テスト環境ではファイルシステムを使用
  if Rails.env.test?
    storage :file
  else
    storage :file  # または :fog など
  end

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  process :crop

  version :icon do
    process resize_to_fill: [ 150, 150 ]
  end

  def crop
    if model.crop_x.present?
      Rails.logger.debug "Cropping with parameters: x=#{model.crop_x}, y=#{model.crop_y}, width=#{model.crop_width}, height=#{model.crop_height}"
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        width = model.crop_width.to_i
        height = model.crop_height.to_i
        img.crop("#{width}x#{height}+#{x}+#{y}")
        img
      end
    else
      Rails.logger.debug "No crop parameters present"
    end
  end

  def default_url
    "/images/fallback/" + [ version_name, "default.png" ].compact.join("_")
  end

  # filter to limit the types of files that can be uploaded.
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_allowlist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg"
  # end
end

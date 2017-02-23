class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::TinyPNG
  include Cloudinary::CarrierWave

  process convert: :png
  process :tinypng

  version :mask do
    process convert: :png
    cloudinary_transformation transformation: :hexagon_center
  end

  version :mask_up do
    process convert: :png
    cloudinary_transformation transformation: :hexagon_up
  end

  version :mask_down do
    process convert: :png
    cloudinary_transformation transformation: :hexagon_down
  end

  version :logo do
    process convert: :png
    process resize_to_fit: [200, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

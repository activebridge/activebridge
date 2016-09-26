class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :mask do
    process convert: :png
    cloudinary_transformation transformation: :hexx
  end

  version :mask_up do
    process convert: :png
    cloudinary_transformation transformation: :hex_up
  end

  version :mask_down do
    process convert: :png
    cloudinary_transformation transformation: :hex_down
  end

  version :logo do
    process convert: :png
    process resize_to_fit: [200, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

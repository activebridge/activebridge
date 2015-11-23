# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :mid do
    process resize_to_fill: [160, 160]
  end

  version :circle do
    process resize_to_fill: [300, 300]
    process convert: :png
    cloudinary_transformation radius: 150;
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process :resize_to_fill => [245, 245]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

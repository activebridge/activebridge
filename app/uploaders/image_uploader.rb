# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :circle do
    process convert: :png
    cloudinary_transformation width: 300, height: 300, radius: 150, crop: :fill, gravity: :face
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

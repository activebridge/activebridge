# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :mask do
    process convert: :png
    cloudinary_transformation transformation: 'mask'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process tags: [:avatar]
  process convert: :jpg
  process resize_to_fill: [200, 200, :face]

  version :mask do
    process convert: :png
    cloudinary_transformation transformation: :mask
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

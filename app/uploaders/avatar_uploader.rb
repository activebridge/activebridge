class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process tags: [:avatar]
  process convert: :jpg
  process resize_to_fill: [200, 200, :face]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

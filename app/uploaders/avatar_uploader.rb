class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process tags: [:avatar]
  process convert: :jpg
  process resize_to_fill: [200, 200, :face]

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

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

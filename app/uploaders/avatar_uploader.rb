class AvatarUploader < BaseUploader
  process tags: [:avatar]
  process convert: :jpg

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
end

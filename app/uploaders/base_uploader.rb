class BaseUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  before :cache, :tinify

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  private

  def tinify(_file)
    source = Tinify.from_file(current_path)
    source.to_file(current_path)
  end
end

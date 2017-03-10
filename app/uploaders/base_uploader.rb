class BaseUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  before :cache, :tinify

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  private

  def tinify(_file)
    Tinify.key = ENV['tinypng_key']
    source = Tinify.from_file(current_path)
    source.to_file(current_path)
  end
end

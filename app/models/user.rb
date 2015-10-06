class User < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  validates :name, :position, :avatar, presence: true
end

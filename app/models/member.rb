class Member < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  validates :name, :position, :avatar, :github, :linkedin, :careers, presence: true
end

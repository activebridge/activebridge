class Member < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  mount_uploader :cartoon, ImageUploader
  validates :name, :position, :cartoon, :avatar, :github, :linkedin, :careers, presence: true
end

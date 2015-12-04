class Member < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  mount_uploader :cartoon, ImageUploader
  validates :name, :position, :avatar, :github, :linkedin, :careers, :priority, presence: true
  validates :priority, uniqueness: true
  validates :cartoon, presence: true, on: :create
end

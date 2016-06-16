class Member < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cartoon, ImageUploader
  has_many :articles

  validates :name, :position, :avatar, :priority, :cartoon, presence: true
  validates :priority, uniqueness: true
  validates :cartoon, presence: true, on: :create
end

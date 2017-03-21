class Member < ActiveRecord::Base
  MAX_PLACEHOLDERS_SIZE = 36
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cartoon, ImageUploader
  has_many :articles

  validates :name, :position, :avatar, :priority, :cartoon, presence: true
  validates :priority, uniqueness: true
  validates :cartoon, presence: true, on: :create

  def self.default_placeholder(hexagon)
    "https://res.cloudinary.com/active-bridge/image/upload/#{hexagon}/v1490098222/hd21tv2jr23hovqrfmd9.png"
  end
end

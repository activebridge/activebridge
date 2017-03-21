class Member < ActiveRecord::Base
  MAX_PLACEHOLDERS_SIZE = 36
  HEXAGONS = {
    mask: [:down, :up, :center],
    mask_down: [:up, :center, :down],
    mask_up: [:center, :down, :up],
  }.freeze

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cartoon, ImageUploader
  has_many :articles

  validates :name, :position, :avatar, :priority, :cartoon, presence: true
  validates :priority, uniqueness: true
  validates :cartoon, presence: true, on: :create

  def self.default_placeholder(align)
    "https://res.cloudinary.com/active-bridge/image/upload/t_hexagon_#{align}/v1490098222/hd21tv2jr23hovqrfmd9.png"
  end
end

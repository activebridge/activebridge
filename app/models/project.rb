class Project < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  mount_uploader :image, ImageUploader
  validates :description, :logo, :technology, :duration, :team_size, :client, :industry, :link, :priority, :image, presence: true
  validates :priority, uniqueness: true
end

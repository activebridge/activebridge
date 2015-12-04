class Project < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  validates :title, :description, :logo, :technology, :duration, :team_size, :client, :industry, :link, :priority, presence: true
  validates :priority, uniqueness: true
end

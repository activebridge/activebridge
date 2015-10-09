class Portfolio < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  validates :title, :description, :logo, :technology, :duration, :team_size, :client, :industry, presence: true
end

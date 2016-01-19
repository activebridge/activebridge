class Article < ActiveRecord::Base
  belongs_to :category

  enum review_status: [:pending, :done]

  validates :title, :body, :category, presence: true

  scope :by_category, -> (slug) { joins(:category).where('categories.slug = ?', slug) if slug }

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :picture, ImageUploader
end

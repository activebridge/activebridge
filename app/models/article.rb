class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  enum review_status: [:pending, :done]

  validates :title, :body, :category_id, :picture, presence: true
  validates :body, length: {minimum: 100}

  scope :by_category, -> (slug) { joins(:category).where('categories.slug = ?', slug) if slug }

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_base64_uploader :picture, ImageUploader

  def increment_viewed
    increment! :viewed unless pending?
  end
end

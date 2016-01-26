class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  enum review_status: [:pending, :done]

  validates :title, :body, :category, :picture, presence: true

  validates :body, length: {minimum: 300}

  scope :by_category, -> (slug) { joins(:category).where('categories.slug = ?', slug) if slug }

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :picture, ImageUploader

  def increment_viewed
    increment! :viewed unless pending?
  end
end

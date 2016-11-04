class Article < ActiveRecord::Base
  paginates_per 5

  belongs_to :member

  enum review_status: [:pending, :done]
  enum category: ['ror-development', 'project-management', 'search-engine', 'team-life']
  validates :title, :body, :category, :picture, presence: true
  validates :body, length: { minimum: 100 }

  scope :by_category, ->(slug) { where('category = ?', slug) if slug }
  scope :blog, lambda { |category, page|
    done
      .includes(:member)
      .by_category(Article.categories[category])
      .page(page)
      .order(created_at: :desc)
  }

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :picture, ImageUploader

  def increment_viewed
    increment! :viewed unless pending?
  end
end

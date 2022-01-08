class Article < ActiveRecord::Base
  paginates_per 9

  belongs_to :member

  enum review_status: %i[pending done]
  enum category: %i[engineering pm-and-team-management business-and-growth inside-ab]
  validates :title, :body, :category, :picture, presence: true
  validates :body, length: { minimum: 100 }

  scope :by_category, ->(slug) { slug ? where(category: slug) : without(:'inside-ab') }
  scope :blog, lambda { |category, page|
    done
      .includes(:member)
      .by_category(category)
      .page(page)
      .order(created_at: :desc)
  }
  scope :without, ->(category) { where.not(category: category) }
  scope :recommended, ->(article) { where.not(id: article).first(3) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :picture, ImageUploader

  def increment_viewed
    increment! :viewed unless pending?
  end
end

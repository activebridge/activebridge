class Article < ActiveRecord::Base
  belongs_to :member
  after_update :subscribers

  enum review_status: [:pending, :done]
  enum category: ['ror-development', 'project-management', 'search-engine', 'team-life']
  validates :title, :body, :category, :picture, presence: true
  validates :body, length: { minimum: 100 }

  scope :by_category, -> (slug) { where('category = ?', slug) if slug }

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_base64_uploader :picture, ImageUploader

  def increment_viewed
    increment! :viewed unless pending?
  end

  private

  def subscribers
    Subscriber.all.map { |subscriber| SubscriptionMailer.new_article(subscriber, self) }
  end
end

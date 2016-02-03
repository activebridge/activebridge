class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  enum review_status: [:pending, :done]

  validates :title, :body, :category, :picture, presence: true

  validates :body, length: {minimum: 300}

  scope :by_category, -> (slug) { joins(:category).where('categories.slug = ?', slug) if slug }
  scope :by_type, lambda { |type, user| send("for_#{user.try(:role) || 'user'}", type, user) }
  scope :for_user, proc { |type, user| done }
  scope :for_member, lambda { |type, user| send("member_#{type}", user) }
  scope :member_pending, proc { |user| pending.where(user: user) }
  scope :member_done, proc { done }
  scope :for_moderator, proc { |type, user| send(type) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :picture, ImageUploader

  def increment_viewed
    increment! :viewed unless pending?
  end
end

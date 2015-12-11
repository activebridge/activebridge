class Article < ActiveRecord::Base
  enum review_status: [:pending, :done]

  validates :title, :body, presence: true
end

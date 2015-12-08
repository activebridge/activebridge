class Article < ActiveRecord::Base
  enum review_status: [:pending, :done]
end

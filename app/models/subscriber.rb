class Subscriber < ActiveRecord::Base
  validates :email, presence: true
end

class User < ApplicationRecord
  validates :slack_name, presence: true
  belongs_to :company
end

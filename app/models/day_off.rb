class DayOff < ApplicationRecord
  validates :date, presence: true

  belongs_to :user
  belongs_to :company
end

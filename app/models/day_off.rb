class DayOff < ApplicationRecord
  DAYOFFS_PER_YEAR = 15
  belongs_to :user
  belongs_to :company

  validates :date, presence: true

  scope :this_months, lambda {
    where(date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
  }

  scope :this_years, lambda {
    where(date: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year)
  }

  scope :general, -> { where(user: nil) }
end

class User < ApplicationRecord
  WORKING_HOURS_PER_DAY = 8

  validates :slack_name, presence: true

  belongs_to :company
  has_many :invoices
  has_many :day_offs

  delegate :name, to: :last_customer, prefix: true
  delegate :accountant, :customers, to: :company, prefix: true

  scope :active, -> { where(deleted: false) }
  scope :developers, -> { where(role: 'developer') }

  def last_customer
    invoices.last&.customer || company.default_customer
  end

  # TODO: use enum
  def developer?
    role == 'developer'
  end

  def admin?
    role == 'admin'
  end

  def accountant?
    role == 'accountant'
  end

  using DateRefinements
  def current_month_working_hours
    day_offs = DayOff.general.this_months + self.day_offs.this_months
    workdays_count = Date.current_month_workdays.count - day_offs.count
    workdays_count * WORKING_HOURS_PER_DAY
  end

end

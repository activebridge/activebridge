class Company < ActiveRecord::Base
  has_many :users
  has_many :customers
  has_many :day_offs

  validates :name, presence: true

  def self.default
    find_or_create_by(name: 'Active Bridge LLC', slack_team_id: ENV['SLACK_TEAM_ID'])
  end

  def default_customer
    customers.first
  end

  def accountant
    users.find_by(role: 'accountant') || users.find_by(role: 'admin') || users.first
  end
end

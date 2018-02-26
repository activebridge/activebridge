class Company < ApplicationRecord
  has_many :users
  has_many :customers
  has_many :day_offs

  validates :name, presence: true

  def self.default
    find_or_create_by(name: 'Active Bridge LLC')
  end

  def default_customer
    customers.first
  end

  def accountant
    users.find_by(role: 'accountant') || users.find_by(role: 'admin') || users.first
  end

end

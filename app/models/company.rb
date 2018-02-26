class Company < ApplicationRecord
  validates :name, presence: true

  has_many :users
  has_many :customers
  has_many :day_offs

  def self.default
    find_or_create_by(name: 'Active Bridge LLC')
  end
end

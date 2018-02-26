class Invoice < ApplicationRecord
  validates_numericality_of :hours, only_integer: true, greater_than: 0, less_than_or_equal_to: 400, allow_nil: true

  belongs_to :user
  belongs_to :customer
end

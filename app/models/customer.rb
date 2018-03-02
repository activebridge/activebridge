class Customer < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :company
  has_many :invoices
end

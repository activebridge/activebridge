class User < ActiveRecord::Base
  include UserOmniable
  has_many :accounts

  accepts_nested_attributes_for :accounts
end
